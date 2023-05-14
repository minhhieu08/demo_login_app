import 'package:agribank_app/models/branch.dart';
import 'package:agribank_app/models/store.dart';

final branches = [
  Branch(
    id: '1',
    name: 'K01-khu vuc mien nui cao - bien gioi',
  ),
  Branch(
    id: '2',
    name: 'k02-khu vuc trung du bac bo',
  ),
  Branch(
    id: '3',
    name: 'k03-khu vuc thanh pho ha noi',
  ),
  Branch(
    id: '4',
    name: 'k04-khu vuc dong bang song hong',
  ),
  Branch(
    id: '5',
    name: 'k05-khu vuc 4 cu',
  ),
  Branch(
    id: '6',
    name: 'k06-khu vuc duyen hai mien trung',
  ),
  Branch(
    id: '7',
    name: 'k07-khu vuc tay nguyen',
  ),
];

final store = [
  Store(
    id: '1',
    city: 'Tuyen Quang',
    branch: Branch(id: '1', name: 'K01-khu vuc mien nui cao - bien gioi'),
  ),
  Store(
    id: '2',
    city: 'Yen Bai',
    branch: Branch(id: '1', name: 'K01-khu vuc mien nui cao - bien gioi'),
  ),
  Store(
    id: '3',
    city: 'Ha noi',
    branch: Branch(id: '2', name: 'k02-khu vuc trung du bac bo'),
  ),
  Store(
    id: '4',
    city: 'Ho chi minh',
    branch: Branch(id: '3', name: 'k03-khu vuc thanh pho ha noi'),
  ),
];
