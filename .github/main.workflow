workflow "Test" {
  resolves = ["sazap10/bugsnag-builds-action@master"]
  on = "push"
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "tag"
}

action "sazap10/bugsnag-builds-action@master" {
  uses = "sazap10/bugsnag-builds-action@master"
  needs = ["Filters for GitHub Actions"]
  secrets = ["BUGSNAG_API_KEY"]
}
