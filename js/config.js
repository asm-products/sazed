System.config({
  "baseURL": '/js/',
  "paths": {
    "*": "*.js",
    "sazed/*": "lib/*.js",
    "github:*": "lib/github/*.js"
  }
});

System.config({
  "map": {
    "bootstrap": "github:twbs/bootstrap@3.3.1",
    "github": "github:michael/github@0.10.3",
    "jquery": "github:components/jquery@1.11.2",
    "masonry": "github:desandro/masonry@3.2.2",
    "github:twbs/bootstrap@3.3.1": {
      "css": "github:systemjs/plugin-css@0.1.0",
      "jquery": "github:components/jquery@1.11.2"
    }
  }
});

