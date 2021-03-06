#### 1. parseInt  [永远都要明确给出radix参数的值](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/parseInt)

如果字符串 string 以"0"开头, 基数是8（八进制）或者10（十进制），那么具体是哪个基数由实现环境决定。ECMAScript 5 规定使用10，但是并不是所有的浏览器都遵循这个规定。因此，永远都要明确给出radix参数的值。

尽管 ECMAScript 3 已经不赞成这种做法，且 ECMAScript 5 已经禁止了这种做法，但是仍然有很多实现环境仍然把以 0 开头的数值字符串（numeric string）解释为一个八进制数。

#### 2. AngularJS: How to Use Filter in Controller
请参考 [AngularJS: How to Use Filter in Controller](http://budiirawan.com/angular-js-use-filter-controller/)

#### 3. AngularJS injectors internals
讲解了angularjs injector的能力, 参考[AngularJS injectors internals](http://agiliq.com/blog/2017/04/angularjs-injectors-internals/)

#### 4. IE bug.将httpStatus=204响应转化为了httpStatus=1223
[IE0013: IE XMLHTTP implementation turns 204 response code into bogus 1223 status code](http://www.enhanceie.com/ie/bugs.asp)

#### 5. 如果设计页面的权限显示
1. 查询所有的权限列表
2. 定义权限 service, UI组件显示，router访问
3. 定义HTTP Interruptor

   [How to do Authorization and Role based permissions in AngularJs](http://nadeemkhedr.com/how-to-do-authorization-and-role-based-permissions-in-angularjs/)

#### 6. AngularJS: Factory vs Service vs Provider
[AngularJS: Factory vs Service vs Provider](https://tylermcginnis.com/angularjs-factory-vs-service-vs-provider/)

#### 7. [Angular-Module-Loading](https://www.ng-book.com/p/Angular-Module-Loading/)
1. run constant() method. 
   
   We always place these at the beginning of all configuration blocks.

2. configuration blocks.
   
   executes blocks of configuration during the provider registration and configuration phases in the bootstrapping of the module.
   
   it’s also important to note that Angular runs these functions in the order in which they are written and registered. That is to say that we cannot inject a provider that has not yet been defined.

3. Run Blocks
   
   run blocks are executed after the injector is created and are the first methods that are executed in any Angular app.
   
   Run blocks are the closest thing in Angular to the main method.

#### 8. angular expression
如何解析表达表达式，借助angular的$parse服务，比如:

```js
getter = $parse(expression);
var result = getter(context);
```

#### 9. angular directive
+ [see $compile] https://docs.angularjs.org/api/ng/service/$compile
  
  注意： scope的绑定中`<attr`在1.5+才生效
+ [Creating Custom AngularJS Directives Part I – The Fundamentals](https://weblogs.asp.net/dwahlin/creating-custom-angularjs-directives-part-i-the-fundamentals)

+ [Understanding Optional AngularJS Bindings](http://www.codelord.net/2017/05/28/understanding-optional-angularjs-bindings/)

  注意：你必须了解directive的bindings与scope的关系，即JS运行的上下文是哪个。对于`&`其运行的context是父scope.

#### 10. [The JavaScript Event Loop: Explained](http://blog.carbonfive.com/2013/10/27/the-javascript-event-loop-explained/)

#### 11. 理解promise

1. [We have a problem with promises](https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html)
2. [JavaScript Promise：简介](https://developers.google.com/web/fundamentals/getting-started/primers/promises#toc-promises-queues)
3. [angular $q](https://docs.angularjs.org/api/ng/service/$q)

这里需要注意的是promise.then(success, err). then返回一个新的promise,该promise由success和err的value进行resolved和rejected. 如果success或者err返回的是一个promise，那么将由该promise作为后续的新的promise.

#### 12. Tim Caswell [Learning Javascript with Object Graphs](https://howtonode.org/object-graphs)

#### 13. angular 优秀实践

Aviv Ben-Yosef http://www.codelord.net/2017/06/11/fixing-angular-template-overuse/

+ Don’t do in the template what can be done elsewere.
+ ***Template event handlers should trigger functions.***
+ Remember the basics, like CSS and HTML form validation.
+ Don’t use ng-init. Just don’t.

### 参考
1. [MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects)
2. [Microsoft JavaScript Language Reference](https://docs.microsoft.com/en-us/scripting/javascript/javascript-language-reference)
