class ListData {
  String title;
  String date;
  String money;

  ListData({this.title, this.date, this.money});

  toLowerCase() {}
}

List<ListData> dummydata = [
  ListData(title: 'Peter', date: '12-03-1998', money: '-1235.59'),
  ListData(title: 'Tony', date: '06-06-1998', money: '+1596.75'),
  ListData(title: 'Natasha', date: '18-01-1996', money: '-9563.15'),
  ListData(title: 'Steven', date: '01-08-1996', money: '-8956.62'),
  ListData(title: 'Steve', date: '23-06-1996', money: '+5962.34'),
  ListData(title: 'kwill', date: '25-05-1996', money: '+5963.54'),
  ListData(title: 'Bruce', date: '01-09-1996', money: '+6959.24'),
];
