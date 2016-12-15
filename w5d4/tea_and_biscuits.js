const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits (callback) {
  reader.question('Would you like some tea?', function(firstAns) {
    console.log(`You replied ${firstAns}.`);
    setTimeout(() => reader.question('Would you like some biscuits?',
      function(secondAns) {
        console.log(`You replied ${secondAns}.`);
        const first = (firstAns === 'yes') ? 'do' : 'don\'t';
        const second = (secondAns === 'yes') ? 'do' : 'don\'t';
        setTimeout(() => callback(first, second), 2500);
    }), 2500);
  });
}

teaAndBiscuits(function(firstRes, secondRes) {
  console.log(
    `So you ${firstRes} want tea and you ${secondRes} want biscuits.`
  );
  reader.close();
});
