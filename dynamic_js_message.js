const randomCharacterPool = '!\#$%&()*0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ^abcdefghijklmnopqrstuvwxyz{}'

function randomNumber(lower, upper) {
		return Math.floor(Math.random() * (upper - lower + 1) + lower);
	}

let scramble = function() {
  let scrambledMessage = ''

  for (let i = 0; i < message.length; i++) {
				let numOfRandomCharacters = randomNumber(1, 50);

				scrambledMessage += `<span hidden>${message[i]}</span>`;

				for (let j = 0; j <= numOfRandomCharacters; j++) {
					let randomIndex = randomNumber(0, randomCharacterPool.length -1);

					scrambledMessage += `<span>${randomCharacterPool[randomIndex]}</span>`;
        }
  }
  message = scrambledMessage
  console.log(message)
}

let unscramble = function() {
  hiddenSpans = message.split("<span hidden>")

  letterArray = Array.from(hiddenSpans).map(character => character[0])

  message = letterArray.join("")
  console.log(message)
}
