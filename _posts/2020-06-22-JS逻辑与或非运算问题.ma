与&&和||不同，!操作符的行为与C、Java等语言是一致的，只返回boolean值(true或false)。

针对于!运算，0以及null、""(空字符串)、NaN、undefined，空对象算是做false，加上!将返回true

console.log(!0);    //true

console.log(!null);//true

console.log(NaN); //true

console.log(!"");//true

console.log(!undefined);/null


与C、Java等语言一样，JavaScript中可以用&&、||、!三个逻辑判断符来对boolean值进行逻辑判断。

与C、Java不同的是，JavaScript中逻辑与(&&)和逻辑或(||)操作符可以应用在任何值上，而操作结束后返回的也不一定是boolean值。

JavaScript中&&的处理规则是这样的： 

1.判断第一个值是否为False。如果为False，则直接返回第一个值。(0，null，空字符串，NaN，undefined，空对象皆可转换为false布尔类型)

2.如果第一个值为True，则直接返回第二个值;

var o = {x:1, y:2};

console.log(o && o.y);//2

console.log(null && x);//null

var o = {x:1, y:2};

console.log(o && o.y);//2

console.log(null && x);//null

逻辑或||的处理规则 

与&&操作符类似，JavaScript中||的处理规则是这样的：
 

1.判断第一个值是否为True。如果为True，则直接返回第一个值。

2.如果第一个值为False，则直接返回第二个值。(0，null，空字符串，NaN，undefined，空对象皆可转换为false布尔类型)
 

||操作符的这种行为使得JavaScript中一些快捷写法成为现实： 

 var a = null;
 
 var b = 42;
 
 var v = a || b || 100;
 
 console.log(v);//42

 var b = null;
 
 var v = a || b || 100;
 
 console.log(v);//100


 function test(p){
 
   p = p || {};//if p is not passed, make it an empty object.
   
 }
