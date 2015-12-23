owasp-skf Cookbook
=====================
This cookbook will install the OWASP-SKF project + 
With the help of a httpd webserver for providing fast performance and security (TLS).

Requirements
------------
This cookbook is only designed for Centos7

#### packages
- `centos7` - owasp-skf Cookbook needs centos7 to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### owasp-skf::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['owasp-skf']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### owasp-skf::default

Just include `owasp-skf` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[owasp-skf]"
  ]
}
```

Contributing
------------

e.g.
  1. Fork the repository on Github
  2. Create a named feature branch (like `add_component_x`)
  3. Write your change
  4. Write tests for your change (if applicable)
  5. Run the tests, ensuring they all pass
  6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

Glenn ten Cate, Riccardo ten Cate

Security Knowledge Framework is an expert system application 
that uses OWASP Application Security Verification Standard, code examples,
helps developers in pre-development and post-development.  
Copyright (C) 2015  Glenn ten Cate, Riccardo ten Cate
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
