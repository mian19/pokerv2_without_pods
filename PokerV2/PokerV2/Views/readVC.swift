

import UIKit

class readVC: UIViewController {

    @IBOutlet weak var tit: UILabel!
    @IBAction func bac(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var tex: UITextView!
    var sec: Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        if sec == 2{
            tit.text = "The Pack"
            tex.text = """
"The standard 52-card pack, sometimes with the addition of one or two jokers, is used. Poker is a one-pack game, but today, in virtually all games played in clubs and among the best players, two packs of contrasting colors are utilized in order to speed up the game. While one pack is being dealt, the other is being shuffled and prepared for the next deal. The procedure for two packs is as follows: While the deal is in progress, the previous dealer assembles all the cards from the pack he dealt, shuffles them, and places them to the left. When it is time for the next deal, the shuffled deck is passed to the next dealer. In many games in which two packs are used, the dealer's left-hand opponent, instead of the right-hand opponent, cuts the pack.
            
            In clubs, it is customary to change cards often and to permit any player to call for new cards whenever they wish. When new cards are introduced, both packs are replaced, and the seal and cellophane wrapping on the new decks should be broken in full view of all the players.

            Card Values/scoring
            While Poker is played in innumerable forms, a player who understands the values of the Poker hands and the principles of betting can play without difficulty in any type of Poker game. Except in a few versions of the game, a Poker hand consists of five cards. The various combinations of Poker hands rank from five of a kind (the highest) to no pair or nothing (the lowest):

            Five of a Kind – This is the highest possible hand and can occur only in games where at least one card is wild, such as a joker, the two one-eyed jacks, or the four deuces. Examples of five of a kind would be four 10s and a wild card or two queens and three wild cards.

            Straight Flush – This is the highest possible hand when only the standard pack is used, and there are no wild cards. A straight flush consists of five cards of the same suit in sequence, such as 10, 9, 8, 7, 6 of hearts. The highest-ranking straight flush is the A, K, Q, J, and 10 of one suit, and this combination has a special name: a royal flush or a royal straight flush. The odds on being dealt this hand are 1 in almost 650,000.

            Four of a Kind – This is the next highest hand, and it ranks just below a straight flush. An example is four aces or four 3s. It does not matter what the fifth, unmatched card is.

            Full House – This colorful hand is made up of three cards of one rank and two cards of another rank, such as three 8s and two 4s, or three aces and two 6s.

            Flush – Five cards, all of the same suit, but not all in sequence, is a flush. An example is Q, 10, 7, 6, and 2 of clubs.

            Straight – Five cards in sequence, but not all of the same suit is a straight. An example is 9♥, 8♣, 7♠, 6♦, 5♥.

            Three of a Kind – This combination contains three cards of the same rank, and the other two cards each of a different rank, such as three jacks, a seven, and a four.

            Two Pairs – This hand contains a pair of one rank and another pair of a different rank, plus any fifth card of a different rank, such as Q, Q, 7, 7, 4.

            One Pair – This frequent combination contains just one pair with the other three cards being of different rank. An example is 10, 10, K, 4, 3.

            No Pair – This very common hand contains "nothing." None of the five cards pair up, nor are all five cards of the same suit or consecutive in rank. When more than one player has no pair, the hands are rated by the highest card each hand contains, so that an ace-high hand beats a king-high hand, and so on.

            Two hands that are identical, card for card, are tied since the suits have no relative rank in Poker. In such a case, the tied players split the pot. Note that if two hands contain the same high pair, then the ranking of the next card in the hands determines which one wins. For example: 9, 9, 7, 4, 2 beats 9, 9, 5, 3, 2. Likewise, two hands that have identical pairs would be decided by the fifth card. For example: Q, Q, 6, 6, J beats Q, Q, 6, 6, 10.

            The Kitty
            By unanimous or majority agreement, the players may establish a special fund called a "kitty." Usually the kitty is built up by "cutting" (taking) one low-denomination chip from each pot in which there is more than one raise. The kitty belongs to all the players equally, and it is used to pay for new decks of cards or for food and drinks. Any chips left in the kitty when the game ends are divided equally among the players who are still in the game. Unlike the rule in some other games, such as Pinochle, when a player leaves a Poker game before it ends, they are not entitled to take their share of chips that comprised part of the kitty.

            Chips
            Poker is almost always played with poker chips. For a game with seven or more players, there should be a supply of at least 200 chips. Usually, the white chip (or the lightest-colored chip) is the unit, or lowest-valued chip, worth whatever the minimum ante or bet is; a red chip (or some other colored chip) is worth five whites, and a blue chip (or some other dark-colored chip) is worth 10 or 20 or 25 whites or two, four or five reds. At the start of the game, each player "buys in" by purchasing a certain number of chips. All of the players usually buy in for the same amount.

            Banker
            One player should be designated as the banker, who keeps the stock of chips and records how many have been issued to each player or how much cash the player has paid for their chips. Players should make no private transactions or exchanges among themselves; a player with surplus chips may return them to the banker and receive credit or cash for them, while a player who wants more chips should obtain them only from the banker.
"""
        }
    }
    


}
