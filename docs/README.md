
## Starting a project from the Jumpstart

The following is the recommended approach for setting up a new project from this jumpstart as it will allow you to easily integrate updates from the jumpstart into your project in the future.

1. Clone jumpstart repo to your project folder `git clone git@github.com:uptech/flutter_lib_jumpstart.git <your-project-name>`
2. Change into your project directory `cd <your-project-name>`
3. Rename the `origin` remote to `jumpstart`, ex: `git remote rename origin jumpstart`
4. Create your repository on GitHub
5. Add your your repository as a remote named `origin`, ex: `git remote add origin <your-repository-url>`
6. Push your local repository up to the remote repository you just setup on GitHub, ex: `git push -u origin main:main`

From this point on you are good to start developing, committing, and integrating changes as you normally would. But this sets you up to easily be able to integrate improvements to jumpstart over time.

## Updating from Jumpstart

To update from the jumpstart we simply do the following.

1. Make sure you or checked out on `main`, ex: `git checkout main`
2. Make sure the local repo knows all about the remote jupmstart repo, ex: `git fetch jumpstart`
3. Merge jumpstarts changes into your `main` branch, ex: `git merge jumpstart/main`

The ease of this process will hopefully aid in you making necessary changes in jumpstart and merging them back into your project. That way we can all share in the progress together.

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
