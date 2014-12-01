set -v
set -x
set -e

JEKYLL_EXISTS=`which jekyll` || echo "jekyll does not exist"
if [ "$JEKYLL_EXISTS" = "" ]; then
    echo "installing jekyll"
    sudo apt-get update
    sudo apt-get install -y ruby-dev nodejs git make
    sh -c "echo \"gem: --no-rdoc --no-ri\" >> ~/.gemrc"
    sudo gem install  jekyll -v 2.4.0
    sudo gem install bundler

    if [ ! -f Gemfile ]; then

    	if [ -f /vagrant/Gemfile ]; then
    		echo "copying gemfile"
    		cp -f /vagrant/Gemfile .

    	else
    		echo "unable to find Gemfile anywhere"
    	fi
    else
    	echo "Gemfile already exists"
    fi

    bundle install
else
    echo "jekyll exists. skipping jekyll and Gemfile installation. if Gemfile updated ssh to machine and run it manually"
fi

# sudo sh -c 'echo "su - vagrant -c \" nohup /usr/local/bin/jekyll serve --port 8080 --watch --limit_posts 1 --source /home/vagrant/ --destination /tmp/_site & \" " > /etc/rc.local'
# sudo sh -c 'echo sleep 120 >> /etc/rc.local'
# sudo /etc/init.d/rc.local start

sudo killall -9 ruby1.9.1 || echo "jekyll is not running"

jekyll serve --port 8080 --detach --watch --limit_posts 1 --source /vagrant/ --destination /tmp/_site



