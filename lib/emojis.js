module.exports = (input) => {
  return input.replace(/(smile|smiles)(\W)/gi, '$1$2🙂$3')
  .replace(/(^|\W)(joke|jokes)(\W)/gi, '$1$2🤪$3')
  .replace(/(^|\W)(money|currency)(\W)/gi, '$1$2💵$3')
  .replace(/(^|\W)(smile|smiling)(\W)/gi, '$1$2🙂$3')
  .replace(/(^|\W)(laugh|laughing)(\W)/gi, '$1$2🤣$3')
  .replace(/(^|\W)(\=\))(\W)/gi, '$1🤣$3')
  .replace(/(^|\W)(angel|angels|devas)(\W)/gi, '$1$2😇$3')
  .replace(/(^|\W)(happiness|happy)(\W)/gi, '$1$2🤗$3')
  .replace(/(^|\W)(sad|saddness)(\W)/gi, '$1$2😭$3')
  .replace(/(^|\W)(confused|confusion)(\W)/gi, '$1$2😕$3')

  .replace(/(^|\W)(angry|mad)(\W)/gi, '$1$2😡$3')

  .replace(/(^|\W)(brain|brains|intelligent|intelligence|smart)(\W)/gi, '$1$2🧠$3')
  .replace(/(^|\W)(dress)(\W)/gi, '$1$2👗$3')

  .replace(/(^|\W)(like)(\W)/gi, '$1$2👍🏻$3')
  .replace(/(^|\W)(water)(\W)/gi, '$1$2💧$3')
  .replace(/(^|\W)(roket|rockets)(\W)/gi, '$1$2🚀$3')
  .replace(/(^|\W)(alien|aliens)(\W)/gi, '$1$2👽$3')
  .replace(/(^|\W)(ship|ufo)(\W)/gi, '$1$2🛸$3')

  .replace(/(^|\W)(robot|robots)(\W)/gi, '$1$2🤖$3')
  .replace(/(^|\W)(shoe|shoes)(\W)/gi, '$1$2👠$3')

  .replace(/(^|\W)(cat|cats|kitten|kittens)(\W)/gi, '$1$2😸$3')
  .replace(/(^|\W)(dog|dogs|doggies|puppy|puppies)(\W)/gi, '$1$2🐶$3')
  .replace(/(^|\W)(mouse|mice|meece)(\W)/gi, '$1$2🐭$3')
  .replace(/(^|\W)(hamster|hamsters)(\W)/gi, '$1$2🐹$3')
  .replace(/(^|\W)(rabbit|rabbits|bunny|bunnies)(\W)/gi, '$1$2🐰$3')
  .replace(/(^|\W)(fox|foxes)(\W)/gi, '$1$2🦊$3')
  .replace(/(^|\W)(panda|pandas)(\W)/gi, '$1$2🐼$3')
  .replace(/(^|\W)(tiger|tigers)(\W)/gi, '$1$2🐯$3')
  .replace(/(^|\W)(lion|lions)(\W)/gi, '$1$2🦁$3')
  .replace(/(^|\W)(monkey|monkies|hanuman)(\W)/gi, '$1$2🐵$3')
  .replace(/(^|\W)(bee|bees)(\W)/gi, '$1$2🐝$3')
  .replace(/(^|\W)(dragon|dragons)(\W)/gi, '$1$2🐲$3')
  .replace(/(^|\W)(worm|worms)(\W)/gi, '$1$2🐛$3')
  .replace(/(^|\W)(frog|frogs|toad|toads)(\W)/gi, '$1$2🐸$3')
  .replace(/(^|\W)(lizard|lizards)(\W)/gi, '$1$2🦎$3')
  .replace(/(^|\W)(snake|snakes)(\W)/gi, '$1$2🐍$3')
  .replace(/(^|\W)(unicorn|unicorns)(\W)/gi, '$1$2🦄$3')
  .replace(/(^|\W)(horse|horses)(\W)/gi, '$1$2🐴$3')
  .replace(/(^|\W)(octopus)(\W)/gi, '$1$2🐙$3')
  .replace(/(^|\W)(dolphin|dolphins)(\W)/gi, '$1$2🐬$3')
  .replace(/(^|\W)(dinosaur|dinosaurs)(\W)/gi, '$1$2🦕$3')
  .replace(/(^|\W)(monarch|butterfly|butterflies)(\W)/gi, '$1$2🦋$3')
  .replace(/(^|\W)(owl|owls)(\W)/gi, '$1$2🦉$3')
  .replace(/(^|\W)(eagle|eagles|garuda)(\W)/gi, '$1$2🦅$3')
  .replace(/(^|\W)(gorilla|gorillas)(\W)/gi, '$1$2🦍$3')



  .replace(/(^|\W)(eternity|infinity)(\W)/gi, '$1$2𝌺$3')

  .replace(/(^|\W)(sun|day|sunlight)(\W)/gi, '$1$2🌞$3')

  .replace(/(^|\W)(moon|lunar|night)(\W)/gi, '$1$2🌝$3')
  .replace(/(^|\W)(earth|gaia|world|planet|planetary)(\W)/gi, '$1$2🌎$3')
  .replace(/(^|\W)(space)(\W)/gi, '$1$2🛰$3')
  .replace(/(^|\W)(galaxy|galaxies)(\W)/gi, '$1$2🌌$3')
  .replace(/(^|\W)(star|stars)(\W)/gi, '$1$2⭐️$3')
  .replace(/(^|\W)(rain|rains|raining|rained)(\W)/gi, '$1$2🌧$3')
  .replace(/(^|\W)(snow|snows|snowing|snowed)(\W)/gi, '$1$2❄️$3')
  .replace(/(^|\W)(rainbow|rainbows)(\W)/gi, '$1$2🌈$3')
  .replace(/(^|\W)(game|games|gaming)(\W)/gi, '$1$2🎮$3')
  .replace(/(^|\W)(airplane)(\W)/gi, '$1$2✈️$3')
  .replace(/(^|\W)(automobile|car|cars)(\W)/gi, '$1$2🚙$3')
  .replace(/(^|\W)(boat|sailboat)(\W)/gi, '$1$2⛵️$3')


  .replace(/(^|\W)(computer|computers)(\W)/gi, '$1$2🖥 $3')
  .replace(/(^|\W)(laptop)(\W)/gi, '$1$2💻 $3')
  .replace(/(^|\W)(mobile)(\W)/gi, '$1$2📱 $3')
  .replace(/(^|\W)(image|images|photo|picture)(\W)/gi, '$1$2🖼$3')

  .replace(/(^|\W)(phone|telephone)(\W)/gi, '$1$2☎️$3')
  .replace(/(^|\W)(music|song|sounds)(\W)/gi, '$1$2🎵$3')
  .replace(/(^|\W)(rockstar|rockstars)(\W)/gi, '$1👨‍🎤$2👩‍🎤$3')
  .replace(/(^|\W)(chat|chatting|chats)(\W)/gi, '$1$2💬$3')
  .replace(/(^|\W)(timing|timer)(\W)/gi, '$1$2⏱$3')
  .replace(/(^|\W)(time|clock|clocks)(\W)/gi, '$1$2⏳$3')
  .replace(/(^|\W)(king|kings)(\W)/gi, '$1$2🤴$3')
  .replace(/(^|\W)(queen|queens)(\W)/gi, '$1$2👸$3')
  .replace(/(^|\W)(svarga)(\W)/gi, '$1$2🌤$3')
  .replace(/(^|\W)(sing|singer|singing)(\W)/gi, '$1$2🎤$3')
  .replace(/(^|\W)(science|microscope)(\W)/gi, '$1$2🔬$3')
  .replace(/(^|\W)(amazing|awesome|boom)(\W)/gi, '$1$2💥$3')
  .replace(/(^|\W)(flash)(\W)/gi, '$1$2📸$3')
  .replace(/(^|\W)(bang|drum)(\W)/gi, '$1$2🥁$3')

  .replace(/(^|\W)(dream|dreams|dreaming)(\W)/gi, '$1$2⛅️$3')
  .replace(/(^|\W)(nature|natural)(\W)/gi, '$1$2🏞$3')

  .replace(/(^|\W)(volt|voltage|power|powerful)(\W)/gi, '$1$2⚡️$3')
  .replace(/(^|\W)(botmaster)(\W)/gi, '$1$2🤖🤠$3')
  .replace(/(^|\W)(flowers)(\W)/gi, '$1$2💐$3')
  .replace(/(^|\W)(flower)(\W)/gi, '$1$2🌷$3')
  .replace(/(^|\W)(rose)(\W)/gi, '$1$2🌹$3')
  .replace(/(^|\W)(roses)(\W)/gi, '$1$2🌹🌹🌹$3')

  .replace(/(^|\W)(apple|apples)(\W)/gi, '$1$2🍎$3')
  .replace(/(^|\W)(orange|oranges)(\W)/gi, '$1$2🍊$3')
  .replace(/(^|\W)(peach|peaches)(\W)/gi, '$1$2🍑$3')
  .replace(/(^|\W)(banana|bananas)(\W)/gi, '$1$2🍌$3')
  .replace(/(^|\W)(lemon|lemons)(\W)/gi, '$1$2🍋$3')
  .replace(/(^|\W)(peach|peaches)(\W)/gi, '$1$2$3')
  .replace(/(^|\W)(strawberry|strawberries)(\W)/gi, '$1$2🍓$3')
  .replace(/(^|\W)(cherry|cherries)(\W)/gi, '$1$2🍒$3')
  .replace(/(^|\W)(corn)(\W)/gi, '$1$2🌽$3')
  .replace(/(^|\W)(tomato|tomatoes)(\W)/gi, '$1$2🍅$3')
  .replace(/(^|\W)(tangerine|tangerines)(\W)/gi, '$1$2🍊$3')
  .replace(/(^|\W)(grape|grapes)(\W)/gi, '$1$2🍇$3')


  .replace(/(^|\W)(coffee)(\W)/gi, '$1$2☕️$3')
  .replace(/(^|\W)(tea)(\W)/gi, '$1$2🍵$3')

  .replace(/(^|\W)(pizza|pizzagate|slice)(\W)/gi, '$1$2🍕$3')
  .replace(/(^|\W)(hotdog|hotdogs)(\W)/gi, '$1$2🌭$3')
  .replace(/(^|\W)(cake|birthday)(\W)/gi, '$1$2🎂$3')
  .replace(/(^|\W)(taco|tacos)(\W)/gi, '$1$2🌮$3')
  .replace(/(^|\W)(ramen|noodle|noodles)(\W)/gi, '$1$2🍜$3')
  .replace(/(^|\W)(rice)(\W)/gi, '$1$2🍚$3')
  .replace(/(^|\W)(chocolate|chocolates)(\W)/gi, '$1$2🍫$3')
  .replace(/(^|\W)(fries)(\W)/gi, '$1$2🍟$3')
  .replace(/(^|\W)(shrimp|shrimps)(\W)/gi, '$1$2🍤$3')
  .replace(/(^|\W)(candy|candies)(\W)/gi, '$1$2🍬$3')
  .replace(/(^|\W)(honey)(\W)/gi, '$1$2🍯$3')

  .replace(/(^|\W)(heart|love)(\W)/gi, '$1$2❤️$3')
  .replace(/(^|\W)(ghost|ghosts)(\W)/gi, '$1$2👻$3')
  .replace(/(^|\W)(death|dead|die)(\W)/gi, '$1$2☠️$3')

  .replace(/(^|\W)(diamond|diamonds)(\W)/gi, '$1$2💎$3')
  .replace(/(^|\W)(crystal)(\W)/gi, '$1$2🔮$3')

  .replace(/(^|\W)(bomb|bombs)(\W)/gi, '$1$2💣$3')
  .replace(/(^|\W)(key|keys)(\W)/gi, '$1$2🔑$3')

  .replace(/(^|\W)(poop|shit|poops|pooping)(\W)/gi, '$1$2💩$3')

  .replace(/(^|\W)(TV|television)(\W)/gi, '$1$2📺$3')
  .replace(/(^|\W)(book)(\W)/gi, '$1$2📖$3')
  .replace(/(^|\W)(books)(\W)/gi, '$1$2📚$3')
  .replace(/(^|\W)(movie|movies)(\W)/gi, '$1$2🎬$3')

  .replace(/(^|\W)(hands)(\W)/gi, '$1$2🤲$3')
  .replace(/(^|\W)(hand)(\W)/gi, '$1$2🤚$3')
  .replace(/(^|\W)(fist)(\W)/gi, '$1$2👊$3')

  .replace(/(^|\W)(gift|present|offering)(\W)/gi, '$1$2🎁$3')

  .replace(/(^|\W)(clap|claps|clapping)(\W)/gi, '$1$2👏$3')

  .replace(/(^|\W)(strong)(\W)/gi, '$1$2🏋️‍♂️$3')

  .replace(/(^|\W)(wheel)(\W)/gi, '$1$2☸️$3')

  .replace(/(^|\W)(glove|gloveswhee)(\W)/gi, '$1$2🧤$3')
  .replace(/(^|\W)(wiener|wienergate|weiner|weinergate|weener|weenergate|weenie)(\W)/gi, '$1$2🌭$3')
  .replace(/(^|\W)(eye)(\W)/gi, '$1$2👁$3')
  .replace(/(^|\W)(eyes)(\W)/gi, '$1$2👀$3')

  .replace(/(^|\W)(art|artists)(\W)/gi, '$1$2🖌$3')

  .replace(/(^|\W)(timephonehack)(\W)/gi, '$1$2📞$3')
  .replace(/\:\-\)/gi, '😀')


}
