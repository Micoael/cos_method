import 'package:cos_method/model/rule.dart';
import 'package:cos_method/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  test('Json converter test', () {
    @deprecated
    ToDoRules rulez = new ToDoRules(isSingle:false, startTime:"2019-07-21", endTime:"2019-07-22", repeat:[[2,2],[3,1]]);
    rulez.lastDoneDate=DateTime.now().toString().substring(0,10);
    String result = RulesJson.getJson(rule: rulez);
    debugPrint('$result');
    ToDoRules rules = RulesJson.formJson(result);
    debugPrint(rules.toVisibleCharts(rules.repeat));
    DisplayToDoList dtl = new DisplayToDoList();
    debugPrint("${dtl.getIsDisplayToDoList(rules)}");
  });


  test('New package',(){
    ToDoRules rulez = new ToDoRules(isSingle:false, startTime:"2019-07-21", endTime:"2019-09-25", repeat:[[2,2],[3,1]]);
    ToDoRules rule2 = new ToDoRules(isSingle:true, startTime:"2019-07-21", endTime:"2019-09-25", repeat:[[2,2],[3,1]]);
    rulez.setDone(rulez);
    String rules = RulesJson.getJson(rule: rulez);
    ToDos tds = new ToDos(
      id: 0,
      piority: 4,
      rule:rules,
      name:'hi'
    );
    bool bl = PraseNewToDo().isDisplayToday(tds);
    debugPrint('$bl');
  });




  test('databaseOfToDo',(){
    
  }
  );

}
