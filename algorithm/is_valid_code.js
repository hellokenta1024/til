
var openerOf = {
  ')': '(',
  ']': '[',
  '}': '{',
};

//let openers = openerOf.values();
var openers = ['(', '[', '{'];
var closers = [')', ']', '}'];

function isOpener(char) {

return openers.includes(char);
}

function isValid(code) {

let codes = [];

for (var i = 0; i < code.length; i++) {
const char = code[i];

if (isOpener(char)) {
codes.push(char);
} else {
let lastOpener = codes.pop();
if (openerOf[char] !== lastOpener) {
  return false;
}
}
}

return codes.length === 0;
}

console.log(isValid("(){}"));