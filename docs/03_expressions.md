# Expressions

You can experiment with the behavior of Terraform's expressions from the Terraform expression console, by running the
terraform console command

## features of Terraform's expression syntax
- Types and Values
- Strings and Templates
- References to Values
- Operators
- Function Calls
- Conditional Expressions
- For Expressions
- Splat Expressions
- Dynamic Blocks
- Type Constraints
- Version Constraints

## Types
- string: "hello"
- number: 15 or 5.123
- bool:   true or false
- list:   ["us-west-1a", "us-west-1b", "us-west-1c"] or ["a", 15, true], starting with zero
- map:    { name = "foo", age= 5 }
- null

## Strings and Templates

```
"Hello, ${var.name}!"

"Hello, %{ if var.name != "" }${var.name}%{ else }unnamed%{ endif }!"

<<EOT
%{ for ip in aws_instance.example.*.private_ip }
server ${ip}
%{ endfor }
EOT
```

### Generating JSON or YAML
- jsonencode
- yamlencode
```
  example = jsonencode({
    a = 1
    b = "hello"
  })

```

## References to Named Values
- Resources:                        References to Named Values
- Input variables:                  var.<NAME>
- Local Values:                     local.<NAME>
- Child module outputs:             module.<MODULE NAME>
- Data sources:                     data.<DATA TYPE>.<NAME>
- Filesystem and workspace info:
  - path.module
  - path.root
  - path.cwd
- Block-local values

## Operators

### Arithmetic operators:
- a + b
- a - b
- a * b
- a / b
- a % b

### Equality Operators:
- a == b
- a != b

### Comparison Operators:
- a < b
- a <= b
- a > b
- a >= b

### Logical Operators:
- a || b
- a && b
- !a


### Order of operations:
When multiple operators are used together in an expression, they are evaluated in the following order of operations:
1. !, - (multiplication by -1)
2. *, /, %
3. +, - (subtraction)
4. \>, >=, <, <=
5. ==, !=
6. &&
7. ||

## Conditional expressions

```hcl
var.a != "" ? var.a : "default-a"
```
