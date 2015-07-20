var DuelDentaku = function(displayId, logId) {
  this.display = $(displayId);
  this.log = $(logId);
  this.tmp = '8000';
  this.show();
  this.addLog();
};
DuelDentaku.prototype = {
  show: function() {
    this.display.text(this.tmp);
  },
  number: function(num) {
    if (this.tmp == '0') {
      this.tmp = num;
    } else {
      this.tmp += num;
    }
    this.show();
  },
  operator: function(op) {
    if (this.tmp.slice(-1) === '+' || this.tmp.slice(-1) === '-') {
      this.tmp = this.tmp.slice(0, -1) + op;
    } else {
      this.tmp += op;
    }
    this.show();
  },
  del: function() {
    if (this.tmp.length === 1 || this.tmp == '') {
      this.tmp = '0';
    } else {
      this.tmp = this.tmp.slice(0, -1);
    }
    this.show();
  },
  equal: function() {
    this.tmp = String(eval(this.tmp));
    this.show();
    this.addLog();
  },
  addLog: function() {
    var date = new Date();
    var timeString = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
    this.log.prepend('<li>' + timeString + ' ' + this.tmp + '</li>');
  }
};
