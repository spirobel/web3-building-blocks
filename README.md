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
This should also be possible with discourse.
## **Installation for development**

clone this repo next to these two other repositories:

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
the link is created with these commands:

```
cd discourse/plugins
ln -s ../../web3-building-blocks/ .
```

## **Implementation plan**

the plugin.rb registers a new route for the editor frontend:
``` ruby
    get '/editor' => 'editor#index'
```
the [controller](https://github.com/spirobel/web3-building-blocks/blob/231228b09f1f0508a70b42e82090049ffb2ec45b/app/controllers/editor_controller.rb#L5) behind it is responsible for statically serving the vite app that is developed in the 
[web3-building-blocks-editor](https://github.com/spirobel/web3-building-blocks-editor) repository. 

The build [output directory](https://github.com/spirobel/web3-building-blocks-editor/blob/4abe87051543baaf0cecb5be5c82095402f28991/vite.config.ts#L8) is set to the public folder in this discourse plugin. So when we run 
```
yarn build
```
in the editor frontend repository, the output files will end up in the right place in this current repo.

**The page builder functionality will be build using [craftjs](https://craft.js.org/).**

The output of the page builder will be saved in the backend. This output will then be served by an api. The routes and hierarchy of the React components can then hydrate the page similar to how the 
[script by @zauberfisch](https://paste.zauberfisch.com/d/62871445eda3b/craftjs-frontend.js.txt)
does it.
Zauberfisch also recommended to use a second static front end for the actual users. (the users that see the final page, not the page building editor). So there will be another repositiory for this frontend that will feature the same UI lego blocks, but without the craftjs related logic.

**contenders for the "post/topic" form:**

[tiptap](https://tiptap.dev/)

[lexical](https://lexical.dev/)

I will probably try lexical. It is new, but seems better suited for React.

**user interface lego blocks**

The components will be build with ant design, because it addresses the most common needs and it is also geared towards react.

[ant design](https://ant.design/components/overview/)

**data fetching and state management**

the data fetching will be done with rtk query. Using the "actions up data down" pattern with redux will hopefully avoid entanglement.

## **Credits**

[@Zauberfisch](https://github.com/Zauberfisch) from the [craftjs discord channel](https://discord.com/invite/sPpF7fX)
for sharing his experience with me on how he implemented a similar system.
