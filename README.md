---
layout: page
category: top
title: README
---

#Sazed

Sazed is an in-place editor for websites that use GitHub Pages. It is somewhat-opinionated, and relies on the GitHub API directly to update the pages.

#Why

The combination of GitHub Pages + Jekyll is awesome. It allows you to write your website in Markdown, and push it live, without even having to compile it yourselves. But the clone/fetch->update->push cycle is not that good for heavy content based websites.

There are currently two alternatives for editing such a site in-browser:

1. GitHub.com UI itself, where you can edit the entire website (including the css, js and other _critical_ files). While this is good for one-off changes, I wanted a full-fledged Markdown editor that _editors_ could use easily.
2. Prose.io. While Prose.IO is great, it introduces a third-website into your already complex flow. Your editors have to understand that edits have to be made on prose.io, which is nowhere related to your actual website. Also, you are just editing the text standalone, with no idea how it will actually look on your website.

#Solution

Sazed solves these issues by flipping the approach: instead of you editing content on a repository, which is then pushed to generate the site; you edit the website itself and those changes are then pushed back to the repo.

To do this, Sazed needs two key pieces:

- Knowledge of the repository url (for eg this repo is `captn3m0/sazed` on GitHub).
- A mapping between website URLs and files on the repo.

The first is added easily by passing the repo as a string to Sazed. The second is not really a mapping, but a translator that takes in website URLs and makes a guess as to where the file would be on the repo.

This is where Sazed being opinionated helps us. We assume the following:

- There are no posts, only pages (Posts will be supported in a future version, by passing the site permalink to Sazed)
- All markdown files have the extension `.md`
- In the case of page-specific permalinks being used, which might confuse Sazed, we allow for a absolute file url being passed to Sazed

Sazed then does the following:
1. Fetches the markdown file from GitHub via the GitHub API
2. Sets up a live in-place editor which can be used to edit the file
3. Pushes the content back to GitHub as a commit over the GitHub API

##Auth
Instead of relying on OAuth (like prose.io), Sazed instead relies on HTTPS Basic Authorization for the GitHub API. This has a few advantages:

1. No third parties are involved.
2. The password is stored in Javascript (not persistent), and is forgotten as soon as the page is closed. In the case of OAuth, tokes are very long-lived and can be used to access your account forever.

This does have a few disadvantages as well:

1. You have to login after every refresh (I'm thinking of ways around this)
2. The JS code gets access to all your repos, even private ones.

Since second is a dangerous responsibility which I don't want to take on, Sazed is released as FOSS software, which must be self-hosted.

##Quick Setup

The primary use-case behind Sazed is a knowledgebase of articles, which multiple people are editing together. As such, Sazed comes with the following ready-to-use:

- Themes for a knowledgebase (via the Raneto project)
- Integrated Search (via lunr)
- Basic content ready

Just clone the repo, edit `_config.yml` and you should be good to go.

##Tech

Sazed relies on the following to do what it does:

- Jekyll as the base site generator
- GitHub Pages as the hosting site
- SystemJS as the module loader
- EpicEditor as the embedded Markdown editor

##Credits

- GitHub for documenting their documentation process, which inspired me to work on this.
- (TODO) for this excellent blog post on SystemJS, which I'm using for Sazed