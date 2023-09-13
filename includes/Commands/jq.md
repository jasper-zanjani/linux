**jq** is used to query JSON documents.

```sh title="Example JSON data"
# Azure account data
az account show > json # (1)

# Last 5 commits to the jq repo
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' # (2)

```

1. 
```json
{
  "environmentName": "AzureCloud",
  "homeTenantId": "9e5dbd21-d5f1-4ca7-8068-e2c0f8551cc9",
  "id": "f2acbad6-5760-4f87-ada7-3753382b2b8f",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantId": "9e5dbd21-d5f1-4ca7-8068-e2c0f8551cc9",
  "user": {
    "name": "jasper.zanjani@outlook.com",
    "type": "user"
  }
}
```
2. 
```json
[
  {
    "sha": "7a72f58d2e92254652162ec7ca1b3074e3a22c35",
    "node_id": "C_kwDOAE3WVdoAKDdhNzJmNThkMmU5MjI1NDY1MjE2MmVjN2NhMWIzMDc0ZTNhMjJjMzU",
    "commit": {
      "author": {
        "name": "Owen Ou",
        "email": "169064+owenthereal@users.noreply.github.com",
        "date": "2023-09-07T18:55:14Z"
      },
      "committer": {
        "name": "GitHub",
        "email": "noreply@github.com",
        "date": "2023-09-07T18:55:14Z"
      },
      "message": "Standarize arch types to AMD64 & ARM64 from index page download dropdown (#2884)\n\nStandarize arch types to AMD64 & ARM64 from index page download\r\ndropdown. These are missed from https://github.com/jqlang/jq/pull/2879.",
      "tree": {
        "sha": "a3a0a822ebc2e7bc598c96cac7a655c2bdee43c5",
        "url": "https://api.github.com/repos/jqlang/jq/git/trees/a3a0a822ebc2e7bc598c96cac7a655c2bdee43c5"
      },
      "url": "https://api.github.com/repos/jqlang/jq/git/commits/7a72f58d2e92254652162ec7ca1b3074e3a22c35",
      "comment_count": 0,
      "verification": {
        "verified": true,
        "reason": "valid",
        "signature": "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJk+hySCRBK7hj4Ov3rIwAAhokIAA5poP2/Ez3X4Cc3aAZwP9mv\nwSLwyOb1LYyQZnapxsMSIdsbkWuwxZ2VrM1Ct9LcSvV1AkVcpBSG7t2nGxng6vDM\nmM37kPkde+8/sXyy0NnoZ+4SSu8Dc6ZmOGrNq8eL9sFR0gbbGhMFDMblV08JOgnc\nD2mat/nWIUrkhpYkjEm6yzH6MXsu7zOW2thz0fviEbPMMv227Shdz5Cbfsr9WyUz\ni2q7Xq0NesO1zWHF0RJI5PW+LpLi2vHScLKJD+loqyKhJfzwVAGe0rQuFLs4NLjK\nKzaTcZpoiXr4JnkfAEdoQL6yNZyHmbOeE2xay4x1DteUbLXZ9HssY1lhkX3dhFc=\n=Bz/U\n-----END PGP SIGNATURE-----\n",
        "payload": "tree a3a0a822ebc2e7bc598c96cac7a655c2bdee43c5\nparent 806475da2942584370a35d75fdd7d1103c17246a\nauthor Owen Ou <169064+owenthereal@users.noreply.github.com> 1694112914 -0700\ncommitter GitHub <noreply@github.com> 1694112914 -0700\n\nStandarize arch types to AMD64 & ARM64 from index page download dropdown (#2884)\n\nStandarize arch types to AMD64 & ARM64 from index page download\r\ndropdown. These are missed from https://github.com/jqlang/jq/pull/2879."
      }
    },
    "url": "https://api.github.com/repos/jqlang/jq/commits/7a72f58d2e92254652162ec7ca1b3074e3a22c35",
    "html_url": "https://github.com/jqlang/jq/commit/7a72f58d2e92254652162ec7ca1b3074e3a22c35",
    "comments_url": "https://api.github.com/repos/jqlang/jq/commits/7a72f58d2e92254652162ec7ca1b3074e3a22c35/comments",
    "author": {
      "login": "owenthereal",
      "id": 169064,
      "node_id": "MDQ6VXNlcjE2OTA2NA==",
      "avatar_url": "https://avatars.githubusercontent.com/u/169064?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/owenthereal",
      "html_url": "https://github.com/owenthereal",
      "followers_url": "https://api.github.com/users/owenthereal/followers",
      "following_url": "https://api.github.com/users/owenthereal/following{/other_user}",
      "gists_url": "https://api.github.com/users/owenthereal/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/owenthereal/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/owenthereal/subscriptions",
      "organizations_url": "https://api.github.com/users/owenthereal/orgs",
      "repos_url": "https://api.github.com/users/owenthereal/repos",
      "events_url": "https://api.github.com/users/owenthereal/events{/privacy}",
      "received_events_url": "https://api.github.com/users/owenthereal/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "web-flow",
      "id": 19864447,
      "node_id": "MDQ6VXNlcjE5ODY0NDQ3",
      "avatar_url": "https://avatars.githubusercontent.com/u/19864447?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/web-flow",
      "html_url": "https://github.com/web-flow",
      "followers_url": "https://api.github.com/users/web-flow/followers",
      "following_url": "https://api.github.com/users/web-flow/following{/other_user}",
      "gists_url": "https://api.github.com/users/web-flow/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/web-flow/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/web-flow/subscriptions",
      "organizations_url": "https://api.github.com/users/web-flow/orgs",
      "repos_url": "https://api.github.com/users/web-flow/repos",
      "events_url": "https://api.github.com/users/web-flow/events{/privacy}",
      "received_events_url": "https://api.github.com/users/web-flow/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "806475da2942584370a35d75fdd7d1103c17246a",
        "url": "https://api.github.com/repos/jqlang/jq/commits/806475da2942584370a35d75fdd7d1103c17246a",
        "html_url": "https://github.com/jqlang/jq/commit/806475da2942584370a35d75fdd7d1103c17246a"
      }
    ]
  },
  {
    "sha": "806475da2942584370a35d75fdd7d1103c17246a",
    "node_id": "C_kwDOAE3WVdoAKDgwNjQ3NWRhMjk0MjU4NDM3MGEzNWQ3NWZkZDdkMTEwM2MxNzI0NmE",
    "commit": {
      "author": {
        "name": "Owen Ou",
        "email": "169064+owenthereal@users.noreply.github.com",
        "date": "2023-09-07T17:54:10Z"
      },
      "committer": {
        "name": "GitHub",
        "email": "noreply@github.com",
        "date": "2023-09-07T17:54:10Z"
      },
      "message": "Update webpage with 1.7 release (#2879)\n\n* Update webpage with 1.7 release\r\n\r\nUpdate webpage with 1.7 release\r\n\r\n* Update docs/content/download/default.yml\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Update docs/templates/index.html.j2\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Update docs/content/download/default.yml\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Don't mention 1.7rc signatures\r\n\r\n* Add link to 1.7 manual\r\n\r\n* binaries -> binary\r\n\r\n* AMD 32-bit to i386\r\n\r\n* Standarize arch types to AMD64, ARM64 & i386 in download page\r\n\r\n---------\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>",
      "tree": {
        "sha": "4f7075b74eab5eb80e7a6c28801f5eb0ec33c9f6",
        "url": "https://api.github.com/repos/jqlang/jq/git/trees/4f7075b74eab5eb80e7a6c28801f5eb0ec33c9f6"
      },
      "url": "https://api.github.com/repos/jqlang/jq/git/commits/806475da2942584370a35d75fdd7d1103c17246a",
      "comment_count": 0,
      "verification": {
        "verified": true,
        "reason": "valid",
        "signature": "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJk+g5CCRBK7hj4Ov3rIwAAAdUIAA0k4QtKRolvxTNMMbnnco+P\n2pSm5/L8ED4MRZg2fpcGTu4B6bkbGQcMZwI9g18N4asiE9YzRxtORRH2aREG5joC\nscV4rSUV8m2dqKHPQglN2dsS+iqZJGM+r19UdCbnMkVPxQnGMq+LDR44c0LtWpG+\nlNdjSG9VBeIYFnUt1B3EU5czUvfLjmAgfbp4xNE4m0zXmsYnxw/3yBEPF0wxyVuW\nh9wK+42vLjW5sxSJWBKCnWN10WgJ5hiyxe//APmAUH85WMKLINgPGcFW8lI+RHm+\n4/zJNJA51or+6ME0bOyTU4HkTVs/087VcQtnhNvvuDXkY+lUVLRrn5jIwD1QY6Y=\n=Wg7u\n-----END PGP SIGNATURE-----\n",
        "payload": "tree 4f7075b74eab5eb80e7a6c28801f5eb0ec33c9f6\nparent 4b579ca31f4ae3d95b757c43c742812884dea5fd\nauthor Owen Ou <169064+owenthereal@users.noreply.github.com> 1694109250 -0700\ncommitter GitHub <noreply@github.com> 1694109250 -0700\n\nUpdate webpage with 1.7 release (#2879)\n\n* Update webpage with 1.7 release\r\n\r\nUpdate webpage with 1.7 release\r\n\r\n* Update docs/content/download/default.yml\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Update docs/templates/index.html.j2\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Update docs/content/download/default.yml\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>\r\n\r\n* Don't mention 1.7rc signatures\r\n\r\n* Add link to 1.7 manual\r\n\r\n* binaries -> binary\r\n\r\n* AMD 32-bit to i386\r\n\r\n* Standarize arch types to AMD64, ARM64 & i386 in download page\r\n\r\n---------\r\n\r\nCo-authored-by: itchyny <itchyny@cybozu.co.jp>"
      }
    },
    "url": "https://api.github.com/repos/jqlang/jq/commits/806475da2942584370a35d75fdd7d1103c17246a",
    "html_url": "https://github.com/jqlang/jq/commit/806475da2942584370a35d75fdd7d1103c17246a",
    "comments_url": "https://api.github.com/repos/jqlang/jq/commits/806475da2942584370a35d75fdd7d1103c17246a/comments",
    "author": {
      "login": "owenthereal",
      "id": 169064,
      "node_id": "MDQ6VXNlcjE2OTA2NA==",
      "avatar_url": "https://avatars.githubusercontent.com/u/169064?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/owenthereal",
      "html_url": "https://github.com/owenthereal",
      "followers_url": "https://api.github.com/users/owenthereal/followers",
      "following_url": "https://api.github.com/users/owenthereal/following{/other_user}",
      "gists_url": "https://api.github.com/users/owenthereal/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/owenthereal/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/owenthereal/subscriptions",
      "organizations_url": "https://api.github.com/users/owenthereal/orgs",
      "repos_url": "https://api.github.com/users/owenthereal/repos",
      "events_url": "https://api.github.com/users/owenthereal/events{/privacy}",
      "received_events_url": "https://api.github.com/users/owenthereal/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "web-flow",
      "id": 19864447,
      "node_id": "MDQ6VXNlcjE5ODY0NDQ3",
      "avatar_url": "https://avatars.githubusercontent.com/u/19864447?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/web-flow",
      "html_url": "https://github.com/web-flow",
      "followers_url": "https://api.github.com/users/web-flow/followers",
      "following_url": "https://api.github.com/users/web-flow/following{/other_user}",
      "gists_url": "https://api.github.com/users/web-flow/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/web-flow/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/web-flow/subscriptions",
      "organizations_url": "https://api.github.com/users/web-flow/orgs",
      "repos_url": "https://api.github.com/users/web-flow/repos",
      "events_url": "https://api.github.com/users/web-flow/events{/privacy}",
      "received_events_url": "https://api.github.com/users/web-flow/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "4b579ca31f4ae3d95b757c43c742812884dea5fd",
        "url": "https://api.github.com/repos/jqlang/jq/commits/4b579ca31f4ae3d95b757c43c742812884dea5fd",
        "html_url": "https://github.com/jqlang/jq/commit/4b579ca31f4ae3d95b757c43c742812884dea5fd"
      }
    ]
  },
  {
    "sha": "4b579ca31f4ae3d95b757c43c742812884dea5fd",
    "node_id": "C_kwDOAE3WVdoAKDRiNTc5Y2EzMWY0YWUzZDk1Yjc1N2M0M2M3NDI4MTI4ODRkZWE1ZmQ",
    "commit": {
      "author": {
        "name": "github-actions[bot]",
        "email": "github-actions[bot]@users.noreply.github.com",
        "date": "2023-09-06T22:49:08Z"
      },
      "committer": {
        "name": "Nico Williams",
        "email": "nico@cryptonector.com",
        "date": "2023-09-06T22:53:36Z"
      },
      "message": "Update signatures of 1.7",
      "tree": {
        "sha": "55a26e2f03712a86cd2c5bc4afcb2319fcefe61d",
        "url": "https://api.github.com/repos/jqlang/jq/git/trees/55a26e2f03712a86cd2c5bc4afcb2319fcefe61d"
      },
      "url": "https://api.github.com/repos/jqlang/jq/git/commits/4b579ca31f4ae3d95b757c43c742812884dea5fd",
      "comment_count": 0,
      "verification": {
        "verified": false,
        "reason": "unsigned",
        "signature": null,
        "payload": null
      }
    },
    "url": "https://api.github.com/repos/jqlang/jq/commits/4b579ca31f4ae3d95b757c43c742812884dea5fd",
    "html_url": "https://github.com/jqlang/jq/commit/4b579ca31f4ae3d95b757c43c742812884dea5fd",
    "comments_url": "https://api.github.com/repos/jqlang/jq/commits/4b579ca31f4ae3d95b757c43c742812884dea5fd/comments",
    "author": {
      "login": "github-actions[bot]",
      "id": 41898282,
      "node_id": "MDM6Qm90NDE4OTgyODI=",
      "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/github-actions%5Bbot%5D",
      "html_url": "https://github.com/apps/github-actions",
      "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
      "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
      "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
      "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
      "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
      "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
      "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
      "type": "Bot",
      "site_admin": false
    },
    "committer": {
      "login": "nicowilliams",
      "id": 604851,
      "node_id": "MDQ6VXNlcjYwNDg1MQ==",
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "11c528d04d76c9b9553781aa76b073e4f40da008",
        "url": "https://api.github.com/repos/jqlang/jq/commits/11c528d04d76c9b9553781aa76b073e4f40da008",
        "html_url": "https://github.com/jqlang/jq/commit/11c528d04d76c9b9553781aa76b073e4f40da008"
      }
    ]
  },
  {
    "sha": "11c528d04d76c9b9553781aa76b073e4f40da008",
    "node_id": "C_kwDOAE3WVdoAKDExYzUyOGQwNGQ3NmM5Yjk1NTM3ODFhYTc2YjA3M2U0ZjQwZGEwMDg",
    "commit": {
      "author": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2023-09-06T13:52:37Z"
      },
      "committer": {
        "name": "Nico Williams",
        "email": "nico@cryptonector.com",
        "date": "2023-09-06T19:05:10Z"
      },
      "message": "Add setlocale() call (fix #1740)",
      "tree": {
        "sha": "3eb4d21413cf215598675b4768d6afeb1f5d91ce",
        "url": "https://api.github.com/repos/jqlang/jq/git/trees/3eb4d21413cf215598675b4768d6afeb1f5d91ce"
      },
      "url": "https://api.github.com/repos/jqlang/jq/git/commits/11c528d04d76c9b9553781aa76b073e4f40da008",
      "comment_count": 0,
      "verification": {
        "verified": false,
        "reason": "unsigned",
        "signature": null,
        "payload": null
      }
    },
    "url": "https://api.github.com/repos/jqlang/jq/commits/11c528d04d76c9b9553781aa76b073e4f40da008",
    "html_url": "https://github.com/jqlang/jq/commit/11c528d04d76c9b9553781aa76b073e4f40da008",
    "comments_url": "https://api.github.com/repos/jqlang/jq/commits/11c528d04d76c9b9553781aa76b073e4f40da008/comments",
    "author": {
      "login": "nicowilliams",
      "id": 604851,
      "node_id": "MDQ6VXNlcjYwNDg1MQ==",
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "nicowilliams",
      "id": 604851,
      "node_id": "MDQ6VXNlcjYwNDg1MQ==",
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "ac3b70d3a118713b24a82da15441788fee6c5d4e",
        "url": "https://api.github.com/repos/jqlang/jq/commits/ac3b70d3a118713b24a82da15441788fee6c5d4e",
        "html_url": "https://github.com/jqlang/jq/commit/ac3b70d3a118713b24a82da15441788fee6c5d4e"
      }
    ]
  },
  {
    "sha": "ac3b70d3a118713b24a82da15441788fee6c5d4e",
    "node_id": "C_kwDOAE3WVdoAKGFjM2I3MGQzYTExODcxM2IyNGE4MmRhMTU0NDE3ODhmZWU2YzVkNGU",
    "commit": {
      "author": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2023-09-05T23:49:55Z"
      },
      "committer": {
        "name": "Nico Williams",
        "email": "nico@cryptonector.com",
        "date": "2023-09-06T18:01:44Z"
      },
      "message": "Add a thank you note to the new owners, admins, and maintainers, and to @stedolan",
      "tree": {
        "sha": "5468b0c72cf6fe481882737e9a1b9eb48063d375",
        "url": "https://api.github.com/repos/jqlang/jq/git/trees/5468b0c72cf6fe481882737e9a1b9eb48063d375"
      },
      "url": "https://api.github.com/repos/jqlang/jq/git/commits/ac3b70d3a118713b24a82da15441788fee6c5d4e",
      "comment_count": 0,
      "verification": {
        "verified": false,
        "reason": "unsigned",
        "signature": null,
        "payload": null
      }
    },
    "url": "https://api.github.com/repos/jqlang/jq/commits/ac3b70d3a118713b24a82da15441788fee6c5d4e",
    "html_url": "https://github.com/jqlang/jq/commit/ac3b70d3a118713b24a82da15441788fee6c5d4e",
    "comments_url": "https://api.github.com/repos/jqlang/jq/commits/ac3b70d3a118713b24a82da15441788fee6c5d4e/comments",
    "author": {
      "login": "nicowilliams",
      "id": 604851,
      "node_id": "MDQ6VXNlcjYwNDg1MQ==",
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "nicowilliams",
      "id": 604851,
      "node_id": "MDQ6VXNlcjYwNDg1MQ==",
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "df95871dd7415627bda6d70ce0569d0a4fbc22c6",
        "url": "https://api.github.com/repos/jqlang/jq/commits/df95871dd7415627bda6d70ce0569d0a4fbc22c6",
        "html_url": "https://github.com/jqlang/jq/commit/df95871dd7415627bda6d70ce0569d0a4fbc22c6"
      }
    ]
  }
]

```


```sh
# Pretty print JSON
cat json | jq

jq '.environmentName' json # => "AzureCloud"
```