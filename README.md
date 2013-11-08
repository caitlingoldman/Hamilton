# Hamilton

**Hamilton**, an awesome iOS event registration app!

## Getting Started

### Development Setup (OSX)

1. Install [CocoaPods](http://cocoapods.org)

		gem install cocoapods
		pod setup

2. Install Dependencies for Hamilton

		pod install

3. Open Xcode workspace via Xcode

		Hamilton.xcworkspace

4. Build/Run project from xCode

### About the group and file structure

* **Hamilton** - App delegate, storyboards, and other top level classes
* **Hamilton/API** - API clients and other networking code
* **Hamilton/Controllers** - View Controllers
* **Hamilton/Models** - Data models, entities, core business logic
* **Hamilton/Views** - Custom views and table view cells
* **Hamilton/Support** - Category methods, macros, and other supporting code that doesn't have another home
* **Resources/Images.xcassets** - Add images here
* **Lib** - code that is isolated from this project

### How to Contribute
##### Adding a feature:
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##### Keep up-to-date:
1. Add upstream (`git remote add upstream git@github.com:adamzaninovich/Hamilton.git`)
2. Fetch lastest upstream master (`git pull upstream`)
3. Checkout master (`git checkout master`)
4. Merge upstream into master (`git merge upstream/master`)
