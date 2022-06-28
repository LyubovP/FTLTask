# README
## Installation
* Start the project locally
# Required to install
- Ruby 3.1.2
- Ruby on Rails 7.0.3
- PostgreSQL 12.11
- Puma as a web server
- Yarn
- Bootstrap 5.1
## Clone
$ `git clone git@github.com:LyubovP/FTLTask.git`
## Setup
$ `bin/setup`
or 
$ `bundle install` 
## How to run local
1. Open terminal.
2. Run `rails server` to start application.
3. Open http://localhost:3000 to view it in the browser.

## Elasticsearch setup
- Instalation (all commands below from link below) 
 <br> https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-20-04
1. $ `curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -`
2. $ `echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list`
3. $ `sudo apt update`
4. $ `sudo apt install elasticsearch`
5. $ `sudo nano /etc/elasticsearch/elasticsearch.yml` or u can use any editor. Then:
- In `network section` insert:
1. `network.host: localhost`
2. `xpack.security.enabled: false`

- It is better to allocate fixed amount of RAM for elasticsearch process: <br>
in `/etc/elasticsearch/jvm.options` insert this lines:<br>
`-Xms###M` <br> `-Xmx###M` <br> example: <br> `-Xms128m` <br> `-Xmx128m` <br>
or use this guide: `https://stackoverflow.com/questions/52421232/elastic-search-high-memory-consumption` <br>


- Then you should be able to run `sudo systemctl start/stop elasticsearch` <br>
  To check if elasticsearch is working properly go to `localhost:9200` <br>

## If you have problem...

If you have problems after starting the server, try these commands `rails db:migrate`, 
or if it does not work try `rails db:create` after `rails db:migrate` and restart server
