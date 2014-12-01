set -v
set -x
set -e

sudo apt-get update
sudo apt-get install -y  ruby1.9.1-dev nodejs git make
sh -c "echo \"gem: --no-rdoc --no-ri\" >> ~/.gemrc"
sudo gem install  jekyll bundler

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

# sudo sh -c 'echo "su - vagrant -c \" nohup /usr/local/bin/jekyll serve --port 8080 --watch --limit_posts 1 --source /home/vagrant/ --destination /tmp/_site & \" " > /etc/rc.local'
# sudo sh -c 'echo sleep 120 >> /etc/rc.local'
# sudo /etc/init.d/rc.local start

jekyll serve --port 8080 --detach --watch --limit_posts 1 --source getcloudify.org/ --destination /tmp/_site


