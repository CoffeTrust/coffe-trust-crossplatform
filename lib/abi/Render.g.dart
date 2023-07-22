// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"address","name":"_coffeShop","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint8","name":"baseId","type":"uint8"}],"name":"getBase","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"_size","type":"uint8"}],"name":"getGlass","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getProduct","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"milkId","type":"uint8"}],"name":"getStockMilk","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"powderId","type":"uint8"}],"name":"getStockPowder","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"syrupId","type":"uint8"}],"name":"getStockSyrup","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"}]',
  'Render',
);

class Render extends _i1.GeneratedContract {
  Render({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getBase(
    BigInt baseId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '5ab2566c'));
    final params = [baseId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getGlass(
    BigInt _size, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '9cdba7ee'));
    final params = [_size];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getProduct(
    BigInt tokenId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'b9db15b4'));
    final params = [tokenId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getStockMilk(
    BigInt milkId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '478c1a45'));
    final params = [milkId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getStockPowder(
    BigInt powderId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '4c8ece41'));
    final params = [powderId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> getStockSyrup(
    BigInt syrupId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '714c8edb'));
    final params = [syrupId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }
}
