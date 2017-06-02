The Redmine Issue Done Ratio Plugin  [![Build Status](https://travis-ci.org/jkraemer/redmine_percent_done.svg?branch=master)](https://travis-ci.org/jkraemer/redmine_percent_done)
===================================

This plugin allows to enforce a certain setting for the `done_ratio` issue
field for just some Issue statuses, while keeping the ability to manually set
the done ratio.

For example, new issues can default to 0%, resolved issues get 100%, but while
working on an issue, the assignee may freely change the done ratio to reflect
actual progress.

[Making of](https://jkraemer.net/2015/11/how-to-create-a-redmine-plugin) -
Redmine plugin creation by example of this plugin.

Installation
------------

Standard Redmine plugin installation instructions apply.

1. Put the plugin into `plugins/redmine_percent_done`
2. Restart the server
3. There is no step 3.

Manual editing of the done ratio only works if _Calculate the issue done ratio
with_ is set to _Use the issue field_ in _Administration_ / _Settings_ / _Issue
tracking_.


License
-------

Copyright (C) 2015 - 2017 [Jens Krämer](https://jkraemer.net)

The Issue Done Ratio plugin for Redmine is free software: you can redistribute
it and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Issue Done Ratio plugin for Redmine is distributed in the hope that it
will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
Public License for more details.

You should have received a copy of the GNU General Public License along with
the plugin. If not, see [www.gnu.org/licenses](https://www.gnu.org/licenses/).

