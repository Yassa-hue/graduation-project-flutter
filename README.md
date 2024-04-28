## How to work with GitHub:
You have to use another branch and a PR to accomplish this task. Please follow these steps:
#### 1- Set up the project
You need to clone the repo using this command:
```
git clone git@github.com:Yassa-hue/graduation-project-flutter.git
```
then navigate to the project directory and install flutter packages using:
```
flutter pub get
```
Make sure the project is correctly set up by running it.

#### 2- Working with git branches
** Note that `signup-page-button` is the name of your branch, you can use another name of your choice ** 
You need to create your own branch in order not to corrupt the master branch. On your project dir run this command to create the branch:
```
git branch signup-page-button 
```
go to the branch:
```
git checkout signup-page-button 
```

Make your changes and commit them as usual, when pushing your changes use this command **Only for the first push** to create the branch in GitHub:
```
git push --set-upstream origin signup-page-button
```
When pushing for the second time the branch will be already created on  GitHub, use only `git push`.

#### 3- Creating the PR:
When pushing the branch, go to the repo on Github, and you will an alert asking you to create a PR. create the PR with the proper title and description and then ask for a review from Yassa or Ihab.

