
    
<style>
      html {
        scroll-behavior: smooth;
      }

      body {
        margin: 0;
      }

      .navigation {
        position: fixed;
        top: 0;
        width: 100%;
        background: green;
        height: 50px;
      }

      .navigation .content {
        display: grid;
        align-items: center;
        height: 100%;
        grid-template-columns: 1fr 100px 100px 100px;
      }

      .logo {
        justify-self: start;
      }

      .link {
        justify-self: end;
      }

      .section {
        height: 100vh;
      }

      .horizonal-size {
        max-width: 1200px;
        margin: 0 auto;
      }

      .header-section {
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-items: center;
      }

      .story {
        text-align: center;
      }

      .headline {
        font-size: 2rem;
      }

      .promo-image {
        width: 100%;
        display: grid;
        justify-content: end;
      }

      .video-section {
        display: grid;
        align-items: center;
        justify-items: center;
      }

      .screen-capture {
        height: 100%;
        width: 100%;
      }

      .animation {
        margin: 100px 0;
        background: green;
        width: 100%;
        height: calc(100% - 200px);
      }

      .benefits {
        display: grid;
        height: 100%;
        width: 100%;
      }

      .cta-section {
        display: grid;
      }

      .download {
        padding-top: 100px;
      }

      .shortcut-list {
        display: grid;
        height: 100%;
        grid-template-columns: auto auto auto;
        justify-items: center;
        align-items: center;
      }

      .shortcut {
        background: gray;
        height: 100px;
        width: 200px;
      }

      .tutorial-section {
        display: grid;
        grid-template-rows: 200px auto;
      }

      .tutorial-section .title {
        padding-top: 100px;
      }

      .tutorials {
        display: grid;
        grid-gap: 10px;
        grid-template-columns: auto auto;
      }

      .tutorial {
        background: gray;
      }
    </style>
    <nav class="navigation">
      <div class="content horizonal-size">
        <a class="logo" href="#header">LessKeys</a>
        <a class="link" href="#video">Benefits</a>
        <a class="link" href="#cta">Download</a>
        <a class="link" href="#tutorial">Tutorials</a>
      </div>
    </nav>

    <div id="header" class="header-section section horizonal-size">
      <div class="story">
        <div class="headline">
          Reduce wrist movement and type faster on any keyboard
        </div>
        <div class="problem-description">
          <div>
            I started to feel slight disconfort in my wrists while typing so I
            replaced my regular keyboard with a kinesis advantage.
          </div>
          <br />
          <div>
            There was a problem though, when I was working remotely it was
            annoying to carry the laptop and the keyboard with me.
          </div>
          <br />
          <div>
            So I started this project so that I can type any key on a classic
            keyboard without moving my wrists.
          </div>
        </div>
      </div>
      <div class="promo-image">
        <div>
          <div>turn this</div>
          <img
            src="https://api.pcloud.com/getpubthumb?code=XZHD9yXZXscdzd3J5Uf6NMGmnThgE4XAFx9k&linkpassword=undefined&size=907x283&crop=0&type=auto"
            width="200px"
            height="100px"
          />
        </div>
        <div>
          <div>into this</div>
          <img
            src="https://api.pcloud.com/getpubthumb?code=XZGs9yXZD5wkwWWI5rF6oc0cDyF0dbaeiUS7&linkpassword=undefined&size=632x295&crop=0&type=auto"
            width="200px"
            height="100px"
          />
        </div>
      </div>
    </div>

    <div id="video" class="video-section section horizonal-size">
      <div class="screen-capture">
        <div class="animation">
          Gif cu secvente cheie din filmul youtube intro ecran minute
          [19:38-20:16]
        </div>
      </div>
      <div class="benefits">
        <div class="benefit benefit1">
          <div>
            Free and open source
          </div>
          <div>
            You can download the app free off charge and if there is a feature
            you want to add you can easily tweak the source code
          </div>
        </div>
        <div class="benefit benefit2">
          <div>
            Adaptable learning curve
          </div>
          <div>
            Unlike the kinesis advantage which requires you to learn a whole new
            layout from the beginning, you can choose to learn in incremental
            steps parts of the new layout
          </div>
        </div>
        <div class="benefit benefit3">
          <div>
            Highly customizeable for power users
          </div>
          <div>
            Want to create your own layout for your custom scenario, no problem,
            easily modify the config files
          </div>
          <div>
            Want to create custom keyboard shortcuts, easily extend the source
            code for your desired shortcuts
          </div>
        </div>
      </div>
    </div>

    <div id="cta" class="cta-section section horizonal-size">
      <div class="download">
        <button class="download-button">DOWNLOAD</button>
      </div>
      <div class="unzip">
        Unzip
      </div>
      <div class="run">
        Run LessKeys
      </div>
      <div class="shortcuts">
        <div class="title">
          Start typing with these shortcuts
        </div>
        <div class="shortcut-list">
          <div class="shortcut shortcut1">
            space↓ + a = left
          </div>
          <div class="shortcut shortcut1">
            space↓ + d = right
          </div>
          <div class="shortcut shortcut1">
            space↓ + w = up
          </div>
          <div class="shortcut shortcut1">
            space↓ + s = down
          </div>
          <div class="shortcut shortcut1">
            space↓ + q = home
          </div>
          <div class="shortcut shortcut1">
            space↓ + e = end
          </div>
          <div class="shortcut shortcut1">
            space↓ + f = backspace
          </div>
          <div class="shortcut shortcut1">
            space↓ + c = enter
          </div>
          <div class="shortcut shortcut1">
            space↓ + r = tab
          </div>
        </div>
      </div>
    </div>

    <div id="tutorial" class="tutorial-section section horizonal-size">
      <div class="title">
        Tutorials to get the most out of LessKeys
      </div>
      <div class="tutorials">
        <div class="tutorial tutorial1">general presentation</div>
        <div class="tutorial tutorial1">my layout</div>
        <div class="tutorial tutorial1">my alternative layout</div>
        <div class="tutorial tutorial1">my shortcuts</div>
        <div class="tutorial tutorial1">my settings</div>
      </div>
    </div>
 