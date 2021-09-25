# _p

_p is a bash script mainly designed to works with [_p templates](https://github.com/0kyn/_p-templates).

## Installation

### Global

To install `_p` globally you should run the [install script](https://github.com/0kyn/_p/blob/master/_p)

```bash
curl -so- https://raw.githubusercontent.com/0kyn/_p/master/install.sh | bash
```

This script clones `_p` repository into your home repository `~/._p`, and add export to your `~/.bashrc`
```bash
export PATH="${_p_install_dir}:${PATH}"
```

Once installed you should restart your terminal, or manually execute the export command above.  
Then just run: 
```bash
_p 
# should display help if correctly installed
```

### Local

Go to the root directory of your current project
```bash 
cd /path/to/projects/projectA
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
# global use
cd /path/to/projects/projectA
_p --init

# local use
./_p --init
```

This command clones [_p templates](https://github.com/0kyn/_p-templates) repository in `/path/to/projects/projectA/._p` and ask for cleaning git related files `.gitignore`, `README.md`, `LICENCE`...

**OR**

Clone [_p templates](https://github.com/0kyn/_p-templates) repository into a folder named `._p`
```bash
git clone https://github.com/0kyn/_p-templates.git ._p
```

### Structure example
_p-templates stands into **._p** directory  
**_p** script **_p.config** stand into the project root directory

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

If you have installed `_p` globally, you don't need `_p` script inside your project directory.

## Usage

### Global installation

If you have choosen to install _p globally, it can be run from everywhere.
The default working directory is the current directory **where you run** `_p`.

```bash
_p --help
```
```bash
# list each project in /path/to/projects
cd /path/to/projects
_p --list
# or
_p --working-dir /path/to/projects --list
```

### Local installation

In the case of a local installation, it runs in the local scope of your current project. 

```bash
./_p --help
```

### Config

`_p.config` contains `_p` configuration:

``` bash
# it will be interpreted as $(pwd)
projects_dir=""

# if you want to arbitrary set default dir containing every projects
projects_dir="/path/to/projects/dir"
# once you defined the variable above the script can interact with projects inside this directory, even if locally installed.

# set directories (projects) to ignore
projects_dir_to_ignore=("projectB" "test" ".*")

# set directories to ignore inside each project
project_dir_to_ignore=("vendor" "node_modules" "._p" "public" ".*")

# set files to ignore inside each project
project_files_to_ignore=("_p*" "README.md")
```

### Show file content

```bash
# global use

## show _memo.md content from projectB

cd /path/to/projects
### if projects_dir="/path/to/projects" in _p.config there's no need to go to projects directory
_p projectB _memo

## or
cd /path/to/projects/projectB
_p _memo
## or
_p --working-dir /path/to/projects/projectB _memo

# local use 
## show _todo.md content from your current project
./_p --file _todo 
## or
./_p _todo

```

**If your project name start with "_", you need to arbitrary define your project name, to avoid conflict, as follow :**
```bash
_p --project-name _projectD _todo
```

### Extract heading(s) block matching pattern from md files
```bash
_p --file _todo --headings Global
```
This will return all items of **## Global** block in `todo.md`.

### Search string pattern in files

```bash
# search @todo string in projectC
cd /path/to/projects/projectC
_p @todo
# search specific pattern
_p --search //TODO

# search @foo string in each project present in the current directory
cd /path/to/projects
_p @foo
```

### Run interactive mode

```bash
_p --interactive
```

## License

[MIT](https://choosealicense.com/licenses/mit/)