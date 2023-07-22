// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"address","name":"admin","type":"address"},{"internalType":"address","name":"_rubc","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"approved","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"uint256","name":"product","type":"uint256"}],"name":"CoffeeBurned","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"barista","type":"address"},{"indexed":true,"internalType":"address","name":"owner","type":"address"}],"name":"CoffeeHouseSet","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"client","type":"address"},{"indexed":true,"internalType":"uint256","name":"id","type":"uint256"}],"name":"CoffeeMinted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"inputs":[],"name":"RubC","outputs":[{"internalType":"contract IERC20","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"uint8","name":"defaultSize","type":"uint8"},{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"image","type":"string"}],"internalType":"struct ICoffeeShop.Base","name":"_base","type":"tuple"}],"name":"addBase","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Milk","name":"_milk","type":"tuple"}],"name":"addMilk","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Powder","name":"_powder","type":"tuple"}],"name":"addPowder","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Size","name":"_size","type":"tuple"}],"name":"addSize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Syrup","name":"_syrup","type":"tuple"}],"name":"addSyrup","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"baseLength","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"product","type":"uint256"},{"internalType":"bytes","name":"signature","type":"bytes"}],"name":"burnCoffee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_id","type":"uint256"}],"name":"exists","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"_base","type":"uint8"}],"name":"getAllowedBaseComponents","outputs":[{"components":[{"internalType":"uint8[]","name":"sizes","type":"uint8[]"},{"internalType":"uint8[]","name":"milks","type":"uint8[]"},{"internalType":"uint8[]","name":"syrups","type":"uint8[]"},{"internalType":"uint8[]","name":"powders","type":"uint8[]"}],"internalType":"struct ICoffeeShop.AllowedComponents","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"index","type":"uint8"}],"name":"getBaseType","outputs":[{"components":[{"internalType":"uint8","name":"defaultSize","type":"uint8"},{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"image","type":"string"}],"internalType":"struct ICoffeeShop.Base","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getCoffeeProduct","outputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Size","name":"size","type":"tuple"},{"components":[{"internalType":"uint8","name":"defaultSize","type":"uint8"},{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"image","type":"string"}],"internalType":"struct ICoffeeShop.Base","name":"base","type":"tuple"},{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Milk","name":"milk","type":"tuple"},{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Syrup","name":"syrup","type":"tuple"},{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Powder","name":"powder","type":"tuple"},{"internalType":"uint256","name":"cost","type":"uint256"}],"internalType":"struct ICoffeeShop.CoffeeProduct","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"index","type":"uint8"}],"name":"getMilkType","outputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Milk","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"index","type":"uint8"}],"name":"getPowderType","outputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Powder","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"index","type":"uint8"}],"name":"getSizeType","outputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"string[3]","name":"image","type":"string[3]"}],"internalType":"struct ICoffeeShop.Size","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"index","type":"uint8"}],"name":"getSyrupType","outputs":[{"components":[{"internalType":"bool","name":"exists","type":"bool"},{"internalType":"string","name":"name","type":"string"},{"internalType":"string[3]","name":"image","type":"string[3]"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct ICoffeeShop.Syrup","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"user","type":"address"}],"name":"getUsersCoffee","outputs":[{"internalType":"uint256[]","name":"","type":"uint256[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"milkLength","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"uint8","name":"base","type":"uint8"},{"internalType":"uint8","name":"size","type":"uint8"},{"internalType":"uint8","name":"milk","type":"uint8"},{"internalType":"uint8","name":"syrup","type":"uint8"},{"internalType":"uint8","name":"powder","type":"uint8"}],"internalType":"struct ICoffeeShop.MintArgs","name":"product","type":"tuple"}],"name":"mintCoffee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"powderLength","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint8","name":"_indexBase","type":"uint8"}],"name":"revokeBase","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"barista","type":"address"}],"name":"revokeCoffeeHouse","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"_indexMilk","type":"uint8"}],"name":"revokeMilk","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"_indexPowder","type":"uint8"}],"name":"revokePowder","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"_indexSize","type":"uint8"}],"name":"revokeSize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"_indexSyrup","type":"uint8"}],"name":"revokeSyrup","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"base","type":"uint8"},{"components":[{"internalType":"uint8[]","name":"sizes","type":"uint8[]"},{"internalType":"uint8[]","name":"milks","type":"uint8[]"},{"internalType":"uint8[]","name":"syrups","type":"uint8[]"},{"internalType":"uint8[]","name":"powders","type":"uint8[]"}],"internalType":"struct ICoffeeShop.AllowedComponents","name":"components","type":"tuple"}],"name":"setAllowedProduct","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"barista","type":"address"},{"internalType":"address","name":"owner","type":"address"}],"name":"setCoffeeHouse","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"sizeLength","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"syrupLength","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transfer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
  'CoffeeShop',
);

class CoffeeShop extends _i1.GeneratedContract {
  CoffeeShop({
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
  Future<_i1.EthereumAddress> RubC({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'b49efeb1'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addBase(
    dynamic _base, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '53a6530b'));
    final params = [_base];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addMilk(
    dynamic _milk, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '8d393a9b'));
    final params = [_milk];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addPowder(
    dynamic _powder, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'd2fe8b16'));
    final params = [_powder];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addSize(
    dynamic _size, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '8d140587'));
    final params = [_size];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addSyrup(
    dynamic _syrup, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '712b3fe8'));
    final params = [_syrup];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> approve(
    _i1.EthereumAddress to,
    BigInt tokenId, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '095ea7b3'));
    final params = [
      to,
      tokenId,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> balanceOf(
    _i1.EthereumAddress owner, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '70a08231'));
    final params = [owner];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> baseLength({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'c91bfe9d'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> burnCoffee(
    BigInt product,
    _i2.Uint8List signature, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '51cdd526'));
    final params = [
      product,
      signature,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> exists(
    BigInt _id, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '4f558e79'));
    final params = [_id];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getAllowedBaseComponents(
    BigInt _base, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '28bd1afd'));
    final params = [_base];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> getApproved(
    BigInt tokenId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '081812fc'));
    final params = [tokenId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getBaseType(
    BigInt index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '2fdab5eb'));
    final params = [index];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getCoffeeProduct(
    BigInt tokenId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '05569ade'));
    final params = [tokenId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getMilkType(
    BigInt index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, 'b105ebbd'));
    final params = [index];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getPowderType(
    BigInt index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, '7c7e51ce'));
    final params = [index];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getSizeType(
    BigInt index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '0a1e6375'));
    final params = [index];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getSyrupType(
    BigInt index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, '1b7f20b8'));
    final params = [index];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<BigInt>> getUsersCoffee(
    _i1.EthereumAddress user, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, '42315959'));
    final params = [user];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<BigInt>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isApprovedForAll(
    _i1.EthereumAddress owner,
    _i1.EthereumAddress operator, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, 'e985e9c5'));
    final params = [
      owner,
      operator,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> milkLength({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, 'a370b984'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> mintCoffee(
    dynamic product, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[23];
    assert(checkSignature(function, 'e200b137'));
    final params = [product];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> name({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[24];
    assert(checkSignature(function, '06fdde03'));
    final params = [];
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
  Future<_i1.EthereumAddress> ownerOf(
    BigInt tokenId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[25];
    assert(checkSignature(function, '6352211e'));
    final params = [tokenId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> powderLength({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[26];
    assert(checkSignature(function, '1f6d3f00'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeBase(
    BigInt _indexBase, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[27];
    assert(checkSignature(function, '27ec3588'));
    final params = [_indexBase];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeCoffeeHouse(
    _i1.EthereumAddress barista, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[28];
    assert(checkSignature(function, '8721bfc9'));
    final params = [barista];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeMilk(
    BigInt _indexMilk, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[29];
    assert(checkSignature(function, '9a2532e0'));
    final params = [_indexMilk];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokePowder(
    BigInt _indexPowder, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[30];
    assert(checkSignature(function, '42ca8dc6'));
    final params = [_indexPowder];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeSize(
    BigInt _indexSize, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[31];
    assert(checkSignature(function, '61ff2aa1'));
    final params = [_indexSize];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeSyrup(
    BigInt _indexSyrup, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[32];
    assert(checkSignature(function, 'cd1f8a6a'));
    final params = [_indexSyrup];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> safeTransferFrom(
    _i1.EthereumAddress from,
    _i1.EthereumAddress to,
    BigInt tokenId, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[33];
    assert(checkSignature(function, '42842e0e'));
    final params = [
      from,
      to,
      tokenId,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> safeTransferFrom$2(
    _i1.EthereumAddress from,
    _i1.EthereumAddress to,
    BigInt tokenId,
    _i2.Uint8List data, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[34];
    assert(checkSignature(function, 'b88d4fde'));
    final params = [
      from,
      to,
      tokenId,
      data,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setAllowedProduct(
    BigInt base,
    dynamic components, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[35];
    assert(checkSignature(function, '89f49fd9'));
    final params = [
      base,
      components,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setApprovalForAll(
    _i1.EthereumAddress operator,
    bool approved, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[36];
    assert(checkSignature(function, 'a22cb465'));
    final params = [
      operator,
      approved,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setCoffeeHouse(
    _i1.EthereumAddress barista,
    _i1.EthereumAddress owner, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[37];
    assert(checkSignature(function, 'ef570d75'));
    final params = [
      barista,
      owner,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> sizeLength({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[38];
    assert(checkSignature(function, 'eac9ff8e'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> supportsInterface(
    _i2.Uint8List interfaceId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[39];
    assert(checkSignature(function, '01ffc9a7'));
    final params = [interfaceId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> symbol({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[40];
    assert(checkSignature(function, '95d89b41'));
    final params = [];
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
  Future<BigInt> syrupLength({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[41];
    assert(checkSignature(function, 'b4c0e548'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> tokenURI(
    BigInt tokenId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[42];
    assert(checkSignature(function, 'c87b56dd'));
    final params = [tokenId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transfer(
    _i1.EthereumAddress to,
    BigInt tokenId, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[43];
    assert(checkSignature(function, 'a9059cbb'));
    final params = [
      to,
      tokenId,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transferFrom(
    _i1.EthereumAddress from,
    _i1.EthereumAddress to,
    BigInt tokenId, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[44];
    assert(checkSignature(function, '23b872dd'));
    final params = [
      from,
      to,
      tokenId,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all Approval events emitted by this contract.
  Stream<Approval> approvalEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Approval');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return Approval(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ApprovalForAll events emitted by this contract.
  Stream<ApprovalForAll> approvalForAllEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ApprovalForAll');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return ApprovalForAll(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all CoffeeBurned events emitted by this contract.
  Stream<CoffeeBurned> coffeeBurnedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('CoffeeBurned');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return CoffeeBurned(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all CoffeeHouseSet events emitted by this contract.
  Stream<CoffeeHouseSet> coffeeHouseSetEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('CoffeeHouseSet');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return CoffeeHouseSet(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all CoffeeMinted events emitted by this contract.
  Stream<CoffeeMinted> coffeeMintedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('CoffeeMinted');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return CoffeeMinted(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all Transfer events emitted by this contract.
  Stream<Transfer> transferEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Transfer');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics! as List<String>,
        result.data!,
      );
      return Transfer(
        decoded,
        result,
      );
    });
  }
}

class Approval {
  Approval(
    List<dynamic> response,
    this.event,
  )   : owner = (response[0] as _i1.EthereumAddress),
        approved = (response[1] as _i1.EthereumAddress),
        tokenId = (response[2] as BigInt);

  final _i1.EthereumAddress owner;

  final _i1.EthereumAddress approved;

  final BigInt tokenId;

  final _i1.FilterEvent event;
}

class ApprovalForAll {
  ApprovalForAll(
    List<dynamic> response,
    this.event,
  )   : owner = (response[0] as _i1.EthereumAddress),
        operator = (response[1] as _i1.EthereumAddress),
        approved = (response[2] as bool);

  final _i1.EthereumAddress owner;

  final _i1.EthereumAddress operator;

  final bool approved;

  final _i1.FilterEvent event;
}

class CoffeeBurned {
  CoffeeBurned(
    List<dynamic> response,
    this.event,
  )   : owner = (response[0] as _i1.EthereumAddress),
        product = (response[1] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt product;

  final _i1.FilterEvent event;
}

class CoffeeHouseSet {
  CoffeeHouseSet(
    List<dynamic> response,
    this.event,
  )   : barista = (response[0] as _i1.EthereumAddress),
        owner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress barista;

  final _i1.EthereumAddress owner;

  final _i1.FilterEvent event;
}

class CoffeeMinted {
  CoffeeMinted(
    List<dynamic> response,
    this.event,
  )   : client = (response[0] as _i1.EthereumAddress),
        id = (response[1] as BigInt);

  final _i1.EthereumAddress client;

  final BigInt id;

  final _i1.FilterEvent event;
}

class Transfer {
  Transfer(
    List<dynamic> response,
    this.event,
  )   : from = (response[0] as _i1.EthereumAddress),
        to = (response[1] as _i1.EthereumAddress),
        tokenId = (response[2] as BigInt);

  final _i1.EthereumAddress from;

  final _i1.EthereumAddress to;

  final BigInt tokenId;

  final _i1.FilterEvent event;
}
