How to use this project?
============================


This project is based on [VAM - Vagrant Automation Machines](https://github.com/guy-mograbi-at-gigaspaces/vagrant-automation-machines)

To use it, you should do the following steps

  - clone it, and VAM to the same folder.
  - create a symbolic link to the jekyll repository you would like to work on from 'synced_folder ==> the jekyll project'
  - then export CONFIG_FILE for your cloud and run

```
git clone https://github.com/guy-mograbi-at-gigaspaces/jekyll-project-vagrant-automation.git
git clone https://github.com/guy-mograbi-at-gigaspaces/vagrant-automation-machines.git
mv  vagrant-automation-machines/* jekyll-project-vagrant-automation
cd jekyll-project-vagrant-automation
ln -s <jekyll project> synced_folder
export CONFIG_FILE=<location to your json file with configuration>
export VAGRANT_HOME=<recommended, optional>
cd <cloud name>
vagrant up --provider <cloud name>
```


# For example

If you want to use AWS, you need to follow configuration example at [VAM - aws example](https://github.com/guy-mograbi-at-gigaspaces/vagrant-automation-machines/blob/master/aws/defaults.json)

Write your configuration to a file. (lets say /tmp/aws.json)

clone your jekyll project (lets say to /tmp/jekyll_project)

and then run the following

```
ln -s synced_folder /tmp/jekyll_project
export CONFIG_FILE=/tmp/aws.json
cd aws
vagrant up --provider aws
```

and you should have jekyll up and running in no time on port 8080 over at amazon.




