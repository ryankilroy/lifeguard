module Internal::PoolToolHelper
  def fetch
    if File.directory?('/tmp/environment-pool')
      g = Git.open('/tmp/environment-pool', :log => Logger.new(STDOUT))
      g.pull
    else
      `mkdir /tmp/environment-pool`
      g = Git.clone('git@github.com:ryanmattcollins/environment-pool.git','environment-pool',:path=>'/tmp')
    end
  end

  def hello
    # clear_db
    fetch
    get_environments

  end

  def clear_db
    Environment.destroy_all
  end

  def get_environments
    pool_tool =  `/tmp/environment-pool/pool-tool -a -n show redeploy`
    pool_tool_array = pool_tool.split(/\r?\n/)

    pool_tool_array.each do |path|
      path_components = path.split('/')

      name = path_components.last

      if (path.include? 'ready/unclaimed') || (path.include? 'patch/unclaimed')
        state = 'ready'
      elsif path.include? 'grounded'
        state = 'grounded'
      elsif (path.include? 'ready/claimed') || (path.include? 'patch/claimed')
        state = 'claimed'
      else
        state = 'redeploy'
      end

      iaas = path_components[2]

      om_version = path_components[3]

      ops_mgr_url = "https://pcf.#{name}.cf-app.com/"

      update_env name, state, ops_mgr_url, iaas, User.first, om_version
    end

  end

  def update_env name, state, ops_mgr_url, iaas, user, om_version
    env = Environment.find_or_initialize_by(name: name)

    env.update_attributes(
      state: state,
      ops_mgr_url: ops_mgr_url,
      iaas: iaas,
      user: user,
      om_version: om_version
    )

  end
end

# does repo exist
#  no: clone
#  yes: fetch


# show
#  params: list of env names
# iterate over env names doing pooltool show
# return: list of env paths

# commit message for env
#  git user
# date claimed



# Lock file
#  - path
#  - commit

# Commit
#  - author
#  - date
#  - message

# Environment
#  - name
#  - iaas
#  - om version
#  - state (enum)


# Mappings
# path -> name
# path -> state
# path -> iaas
# path -> om version




# hardcoded data
#  concourse urls
#  gituser <-> team
#  "substates"


# def git
#   if File.directory?('/tmp/pool')
#   `mkdir /tmp/pool`
#   g = Git.clone('git@github.com:ryanmattcollins/environment-pool.git','environment-pool',:path=>'/tmp/pool')
#   p "*********:)**********"
#   puts g
#   puts g.log.first
#   p "**********:(**********"

#   commit = g.log(1).object('README.md').first

#   p `/tmp/pool/environment-pool/pool-tool show redeploy`

#   `rm -rf /tmp/pool`

#   name = commit.author.name
#   email = commit.author.email
#   date = commit.author.date
#   message = commit.message

#   render :json => {name: name, email: email, date: date, message: message}
# end
