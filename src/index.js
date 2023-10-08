const Parser = require("tree-sitter");
const JavaScript = require("tree-sitter-javascript");

const parser = new Parser();
parser.setLanguage(JavaScript);

/**
 * Convert a syntax node to an object
 * @param {Parser.SyntaxNode} node
 */
function toObject(node) {
  return {
    type: node.type,
    text: node.text,
    children: node.children.map((child) => toObject(child)),
  };
}

const sourceCode = "let x = 1; console.log(x);";
const tree = parser.parse(sourceCode);
console.log(toObject(tree.rootNode));
