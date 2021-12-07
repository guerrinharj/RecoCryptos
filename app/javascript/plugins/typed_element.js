import Typed from 'typed.js';

const typedFcn = () => {

  const cardDescription = [
  "<span><h2>What’s RecoCryptos?</h2><p>RecoCryptos is an app for inexperienced yet enthusiasts of the crypto world! With realtime interactions and tips between users from all kinds of backgrounds</p></span>",
  "<span><h2>Why should i use it?</h2><p>Investing in crypto can be too much sometimes, and the scene is crippled by people who aren’t interested in share their knowledge. We value ourselves in creating a real community with a very straightforward approach.</span>",
  "<span><h2>What else?</h2><p>You also win a wallet simulator so you can calculate before doing transactions. All of this with always updateddata coming from all the main cryptocurrency across the globe.</p></span>"
]


  var options = {
    strings: [cardDescription[1], cardDescription[2], cardDescription[3]],
    typeSpeed: 1,
    backSpeed: 80
  };

  var typed = new Typed('.card-description', options);


}

export { typedFcn }
