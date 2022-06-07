# **Web 3 Building Blocks** Plugin

The goal of this plugin is to give users the ability to easily build custom pages with discourse. 
You can think of it like [elementor](https://www.youtube.com/watch?v=E15iQEm9KF8), 
but for discourse.

**example use case**

Many DAOs use discourse categories as a [place](https://forum.bankless.community/c/proposals/7) to collect and discuss grant proposals. To create a grant, the user needs to register in the forum, navigate to the grants category and press the "create topic button". A [typical proposal](https://forum.metacartel.org/t/proposal-metokens-the-defi-fair-launch-of-personal-tokens/956) is basically just a discourse thread.
Creating such a thread is very easy for someone who knows: 1. What forum software is. 2. How to create an account and navigate this specific forum software. 3. How to properly format text in markdown.

In an ideal world this limitation should not exist. There are people out there, that dont have this knowledge and still have lots of worthwhile things to contribute.

>The only "filter" to contribute to a DAO should be that you are curious and open minded enough to have a browser wallet installed.

So the page should only consist of a "Login with Etherum" button, the other grants (to act as a reference of what is expected) and a form with a button that says "submit proposal!"   

**grants are just an example**

Grants are just one example for a "data piece" that is raw material and product of a DAO. People build the [craziest things](https://www.youtube.com/watch?v=wah4W3XuDzE) with the help of advanced custom fields, elementor and wordpress.
The information architecture and the UX of the website can be entirely custom without ever writing a piece of code.
This should also be possible with discourse (which has much more powerful moderation and community features than wordpress)

## **Installation for development**

clone this repo next to:

[discourse](https://github.com/discourse/discourse)

[web3-building-blocks-editor](https://github.com/spirobel/web3-building-blocks-editor)

follow this [guide](https://meta.discourse.org/t/beginners-guide-to-install-discourse-for-development-using-docker/102009) to install your discourse developer instance.

**Folder Structure**

```
discourse  <--- main discourse repository
web3-building-blocks   <--- discourse plugin
web3-building-blocks-editor <-- vite react editor ui frontend
```

the discourse plugin is linked via a symbolic link
into the main discourse repository.
the link was created with these commands:

```
cd discourse/plugins
ln -s ../../web3-building-blocks/ .
```

## **Implementation plan**