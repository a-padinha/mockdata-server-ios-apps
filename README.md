# Mock Server for ios apps

<dd>This is a mock data server setup can be used to support UI Automation tests running on emulator or real device</dd>
<dd>Ruby Thin server + Sinatra DSL + Daplie.me free SSL certificates</dd>

</p>

## Getting started

<dl>
  <dt>Dependencies:</dt>
  <dd>RVM with Ruby version 2.0.0 (2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin15])</dd>

  <dt>Ruby Gems:</dt>
  <dd>Sinatra (1.4.8), Thin (1.7.0), sinatra-contrib (1.4.7) </dd>
</dl>

### Install Brew, RVM and Ruby:

Install Brew 
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install gnupg2
```
$ brew install gnupg2
```
```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```

Install RVM
```
$ \curl -sSL https://get.rvm.io | bash
```
NOTE: after RMV is installed run the command displayed o the terminal, similar to: /Users/user.name/.rvm/scripts/rvm

Install Ruby 
```
$ rvm install 2.0.0
```
Check ruby version
```
$ rvm ruby -v 
```
NOTE: If after last command the ruby version isn't 2.0.0 please use the following command to force RVM 
use ruby 2.0.0
```
$ rvm use 2.0.0
```

### Install Gems:
```
$ gem install Sinatra
```
```
$ gem install Thin 
```
```
$ gem install sinatra-contrib
```

### Run the project:
```
$ cd /project_folder
```
```
$ ruby appmock.rb
```
```
RUBY THIN SERVER STARTS AT:
127.0.0.1:8443 or https://localhost.daplie.me:8443
CommandLine do "CTRL + C"  to stop running the server 
== Sinatra has ended his set (crowd applauds) 
```

## Integrate Mock Server endpoint with ios apps

To run UI Automated tests with the app pointing to the mock server, 
change create a target pointing to the mockserver endpoint:
</p>
<dd>L > Mock : http://127.0.0.1:8443</dd>
</p>
For SSL use dapplie SSL free certificates
</p>
<dd>L > Mock : https://localhost.daplie.me:8443</dd>
</p>

### Emulator Setup
- Run mock server $ruby mock-server.rb
- Run the emulator with a build pointing to the mock server
- Run UI Tests

### Real Device Setup
- Run mock server $ruby mock-server.rb
- Run the emulator with a build pointing to the mock server 
- Open Charles Proxy go to Proxy > SSL Proxying > Add : 127.0.0.1:8443 or localhost.daplie.me:8443
- Charles Proxy > Help > SSL Proxying > (4th option) Install certificate on Device > configure the device to the IP address (example: 10.5.19.19:8888) TODO:. Replace Charles Proxy for a commandline tool.
- Run UI Tests
