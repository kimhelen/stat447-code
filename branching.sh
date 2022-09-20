
## git branching examples

## Setup: URL is https://github.com/eddelbuettel/data-examples.git

## set just in case (as in new projects / on a new machine)
git config --global user.name "Dirk Eddelbuettel"
git config --global user.email "edd@debian.org"

## check logs
git log --graph --pretty=format:'%h %d %s (%cr) <%an>' --abbrev-commit


## create a branch and check out into it
git checkout -b feature/new_data
git status

## lets create something new
mkdir newdata
cd newdata
touch somefile.txt
echo "A B C" >> somefile.txt
echo "1 2 4" >> somefile.txt
echo "2 3 2" >> somefile.txt
git status

## and add it
cd newdata
git add somefile.txt
git commit -m "adding new data file"
git log --graph --pretty=format:'%h %d %s (%cr) <%an>' --abbrev-commit

## check it
pwd
ls -lF
cd newdata
pwd
ls -l 

## now switch branch: "gone"
git checkout master
git branch -a
ls -lF
cd newdata
ls -lF 


### switch back: "back"
git checkout feature/new_data
git branch -a
ls -lF
cd newdata
ls -lF 

## so switch back to master -- and merge
git checkout master
git branch -a
ls -lF
## no newdata here!
git merge feature/new_data
ls -lF

## Git log
git log --graph --pretty=format:'%h %d %s (%cr) <%an>' --abbrev-commit
git branch -a
