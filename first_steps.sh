
## git 'sandbox' exercise


## create a clean 'scratch' directory
if [ -d scratch ]; then
  rm -rf scratch
fi
mkdir scratch
cd scratch
pwd
ls

## we need to tell git ourselves
git config --global user.name  "Dirk Eddelbuettel"
git config --global user.email "edd@debian.org"
## check it
git config --global user.name
git config --global user.email
## another check
cat ~/.gitconfig

## Scratch repo
git init

## Status
git status


## Initial file
echo "Some not so important content." > one_file.txt
echo "Some more on line two." >> one_file.txt
git status

## Adding it
git add one_file.txt
git status

## Commiting it
git commit -m "Our first commit"

## Check status
git status

## Log
git log

## Adding a second file
echo "One more" > second_file.txt
echo "Second line" >> second_file.txt
git add second_file.txt
git commit -m "Another file"
git log

## Now: show files
ls -l

## Add content
echo "Another line." >> second_file.txt
git status

## Check
git diff

## Commit modified file
git add second_file.txt
git commit -m "expand file two"

## Log
git log

## More compact Log
git log --graph --pretty=format:'%h %d %s (%cr) <%an>' --abbrev-commit

## Delete a file: List first
ls -l

## Delete a file: Remove it
rm one_file.txt
ls -l  # it's gone

## Delete a file: status
git status

## Delete a file: revert to previous state
git checkout -- one_file.txt
ls -l  # file is back

## Delete a file: status
git status

## Similarly commits sequences can be reset
## this reset the commit, but leaves the file modified
git reset HEAD~1

cat second_file.txt

## Revert
git status

## Undoing that last step
git checkout -- second_file.txt
git status

## And getting back to where we were
git reset HEAD
git log --graph --pretty=format:'%h %d %s (%cr) <%an>' --abbrev-commit

## We could also do hard resets
## this would reset 'hard' and undo the modification too
#git reset --hard HEAD~1
