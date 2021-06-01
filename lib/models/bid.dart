import './card.dart';
import './player.dart';

class Bid {
  final Player _player;
  final Card _offer;

  const Bid(this._player, this._offer);

  Card get offer => _offer;
  Player get player => _player;
}
