# _p

_p is a bash script mainly designed to works with [_p templates](https://github.com/0kyn/_p-templates).

## Installation

Go to the root directory of your current project
```bash 
cd /path/to/project
```

Download the script & the config file
```bash
curl https://raw.githubusercontent.com/0kyn/_p/master/_p -o _p
curl https://raw.githubusercontent.com/0kyn/_p/master/_p.config.example -o _p.config

# make _p executable
chmod +x _p
```

## Install default _p templates

Run _p initialization

```bash
./_p --init
```

**OR**

Clone [_p templates](https://github.com/0kyn/_p-templates) repository into a folder named `._p`
```bash
git clone https://github.com/0kyn/_p-templates.git ._p
```

### Structure example
_p-templates stands into **._p** directory  
**_p** script stands into the project root directory

projects/  
├─ projectA/  
│  ├─ **._p**/  
│  ├─ node_modules/  
│  ├─ public/  
│  ├─ src/  
│  ├─ vendor/  
│  ├─ **_p**  
│  ├─ **_p.config**  
│  ├─ .gitignore  
│  ├─ composer.json  
│  ├─ package.json  
│  ├─ README.md  
├─ projectB/  
├─ projectC/  
├─ _projectD/  


## Usage

```bash
./_p --help
```

### Local scope

By default, it runs in the local scope of your current project where you installed _p.

### Global scope

It could be used to runs command in a global scope, to deal with each *project* contained in *projects* directory.
If you want to run global scope as default, you need to edit config file.

### Config

`_p.config` contains `_p` configuration:

``` bash
# default local scope
local=true # set to false to use global scope as default

# needed to use the global scope
# define the directory containing every projects
default_projects_dir="/path/to/projects_dir"

# [...]
```

You migth set `local` to `false` to interact with every projects.

### List projects

```bash
./_p --list
```

### Show file content

```bash
# show _todo.md content from your current project
./_p --file _todo

# show _memo.md content from projectB (required $default_projects_dir defined in _p.config)
./_p --global projectB _memo
```

**If your project name start with "_", you need to arbitrary define your project name, to avoid conflict, as follow :**
```bash
./_p --project-name _projectD _todo
```

### Extract heading(s) block matching pattern from md files
```bash
./_p --file _todo --headings Global
```
This will return all items of **## Global** block in `todo.md`.

### Search string pattern in files

```bash
# search @todo string in your current project
./_p @todo

# search specific pattern in your current project
./_p --search //TODO

# search @foo string in each project from projects directory defined in $default_projects_dir
./_p --global @foo
```

### Run interactive mode

```bash
./_p --interactive
```

## License

[MIT](https://choosealicense.com/licenses/mit/)