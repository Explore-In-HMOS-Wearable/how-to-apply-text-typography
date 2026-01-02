import MainScreen from './MainScreen';

@Entry
@Component
struct Index {
  @Provide('pages') pages: NavPathStack = new NavPathStack();

  @Builder
  PagesMap(name: string) {
    if (name === 'MainScreen') {
      MainScreen()
    }
  }

  aboutToAppear(): void {
    if (this.pages === undefined) {
      this.pages = new NavPathStack();
    }

    this.pages.pushPathByName('MainScreen',0)

  }


  build() {
    Navigation(this.pages) {
    }
    .hideTitleBar(true)
    .hideToolBar(true)
    .hideNavBar(true)
    .mode(NavigationMode.Stack)
    .navDestination(this.PagesMap)
  }
}