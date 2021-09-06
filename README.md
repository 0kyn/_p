# _p

_p is a project related set of .md files trying to solve @todo lies, human memory leak, and more... 


## Installation

Go to the root directory of your current project
```bash 
cd /path/to/project
```

Clone the repository into a folder named `._p`.
```bash
git clone https://github.com/0kyn/_p.git ._p
```

If you don't want _p to be a git submodule of your current project, you should only clone the master branch of the repository, without keeping `.git` directory.
```bash
git clone --depth=1 --branch=master https://github.com/0kyn/_p.git ._p
rm -rf ._p/.git
```

Go to `._p`
```bash
cd ._p
```

### Structure example

projects/  
├─ projectA/  
│  ├─ **._p**/  
│  ├─ node_modules/  
│  ├─ public/  
│  ├─ src/  
│  ├─ vendor/  
│  ├─ .gitignore  
│  ├─ composer.json  
│  ├─ package.json  
│  ├─ Readme.md  
├─ projectB/  
├─ projectC/  

You might also want to add `._p` directory to your root `.gitignore` file, in the case where you store sensitive informations in these files and/or your repository is going to be public.


## Markdown Files

- `_bugs.md`    : Describes tricky bugs and how you solved it
- `_todo.md`    : Lists tasks per module, note some features ideas, enhancements, usefull resources...
- `_tools.md`   : Uses as a reminder for command line you need to run regularly (npm docker composer)
- `_memo.md`    : Uses to store some technical specs, (temporary testing only /!\\) credentials, keywords related to your project

You can add or edit as many md files as you want. ex: `_guideline.md`, `_doc.md`, `_tutorial.md`...

## Usage

`_p` is a bash script file that could be used to interact with md files and even read your projects files.

```bash
./_p --help
```

### Local scope

By default, it runs in the local scope of your current project where you installed _p.

### Global scope

It could be used to runs command in a global scope, to deal with each *project* contained in *projects* directory.
If you want to run global scope as default, you need to edit config file.

### Config

Rename `_p.config.example` file
```bash
mv _p.config.example _p.config
```
`_p.config` contains `_p` configuration of which:

``` bash
# default local scope
local=true # set to false to use global scope as default

# needed to use the global scope
# define the directory containing every projects
default_projects_dir="/path/to/projects_dir"

# [...]
```

You migth set `local` to `false` to interact with every projects.

### Run interactive mode

```bash
./_p --interactive
```

### List projects

```bash
./_p --list
```

### Show file content

```bash
# show _todo.md content from your current project
./_p --file _todo

# show _memo.md content from projectB (required global scope)
./_p --global projectB _memo
```

**If your project name start with "_", you need to arbitrary define your project name, to avoid conflict, as follow :**
```bash
./_p --project-name _projectD _todo
```

### Search string pattern in files

```bash
# search @todo string in your current project
./_p @todo

# search specific pattern in your current project
./_p --search //TODO

# search @foo string in each project from projects directory defined in $default_projects_dir
./_p --global @foo
```


## /!\ Warning /!\

From the moment where you store sensitive data into these .md file you should be carefull.  
`_memo.md` **should never contains publicly exposed environments credentials and should not be publicly avalaible.** 


## License

[MIT](https://choosealicense.com/licenses/mit/)