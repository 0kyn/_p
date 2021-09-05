# _p

_p is a project related set of .md files trying to solve @todo lies, human memory leak, and more... 

## Installation
Clone the repository into the root directory of your current project in a folder named `._p`.


```bash
git clone https://github.com/0kyn/_p.git [ALL_PROJECTS_DIR]/[PROJECT_DIR]/._p

cd [ALL_PROJECTS_DIR]/[PROJECT_DIR]/._p
```

### Structure example
├── `._p`  
├── app  
├── public  
├── node_modules  
├── vendor  
├── test  
├── composer.json  
├── README.md  
├── package.json  
└── .gitignore  

You might also want to add `._p` directory to your root `.gitignore` file, in the case you store sensitive informations in these files.

## Markdown Files
- `bugs.md` : Describe tricky bugs and how you solved it
- `todo.md` : List tasks per module, note some features ideas or enhancements, usefull resources for your project
- `tools.md` : Uses as a reminder for command line you need to run regularly (npm docker composer)
- `memo.md` : A static brain to store some technical specs, (temporary testing only /!\\) credentials.

You can add or edit as many md files as you want. ex: `guideline.md`, `doc.md`, `tutorial.md`...

## CLI
`_p` could be used to interact with md files or even read file from your project.

Command could be run **locally** to deals only to **current project**, or **glabally** to deals with **all projects** contained in [ALL_PROJECTS_DIR]

### Config
Rename config sample file
```bash
mv _p.config.example _p.config
```
`_p.config` contains `_p` configuration such as your root directory path containing all your project, default `._p` directory name etc...

You migth change `local` to `true` to interact with every projects.

### Run interactive mode
```bash
./_p -i
```

### List projects
```bash
./_p -ls
```

### Show file content
```bash
# show todo.md content of
./_p app.test -f todo

# show memo.md content
./_p app.test _memo
```

### Search pattern in file
```bash
# search files containing @todo in app.test project
./_p app.test @todo

# search specific pattern in app.test project
./_p app.test -s _CONST

# search files containing @foo in all projects from [ALL_PROJECTS_DIR]
./_p @foo
```

## /!\ Warning /!\
From the moment you store sensitive data into these .md file you should be carefull.  
`memo.md` **should never contains publicly exposed environments credentials and should not be publicly avalaible.** 


## License
[MIT](https://choosealicense.com/licenses/mit/)