#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require 'connect/dsl'
  require 'connect/lexer'

module Connect
  class Dsl < Racc::Parser

module_eval(<<'...end dsl.y/module_eval...', 'dsl.y', 252)

  def parse(input)
    scan_str(input) unless empty_definition?(input)
  end

  def power(v1,v2)
    v1 ^ v2
  end

  def multiply(v1,v2)
    v1 * v2
  end

  def divide(v1,v2)
    v1 / v2
  end

  def add(v1,v2)
    v1 + v2
  end

  def subtract(v1,v2)
    v1 - v2
  end

  def do_or(v1,v2)
    v1 || v2
  end

  def do_and(v1,v2)
    v1 && v2
  end

  def on_error(token, value, vstack )
    position =  "Syntax error on line #{lineno} of config file '#{current_file}'"
    text = @ss.peek(20)
    unless value.nil?
      msg = "#{position} at value '#{value}' : #{text}"
    else
      msg = "#{position} at token '#{token}' : #{text}"
    end
    if @ss.eos?
      msg = "#{position}: Unexpected end of file"
    end
    raise ParseError, msg
  end
...end dsl.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    17,   120,     9,    10,   121,     9,    10,    24,    25,   139,
     9,    10,   139,     9,    10,    20,    39,    40,   113,    36,
    37,   144,   110,   139,   153,   126,    88,    11,    89,   108,
    11,    14,   140,    16,    14,    11,    16,    20,    11,    14,
    98,    16,    14,   130,    16,    94,     9,    10,    42,    43,
    98,    54,     9,    27,    24,    25,    46,    47,    39,    40,
     9,    10,    42,    43,    96,    54,    53,    76,    24,    25,
    46,    47,   133,     9,    10,    42,    43,    88,    54,    89,
    53,    24,    25,    46,    47,    91,     9,    10,    42,    43,
    88,    54,    89,    53,    24,    25,    46,    47,    64,     9,
    10,    42,    43,    88,    54,    89,    53,    24,    25,    46,
    47,     9,    27,   101,    42,    43,    63,    54,    60,    53,
    24,    25,    46,    47,     9,    27,   101,    42,    43,   141,
    54,    57,    53,    24,    25,    46,    47,    36,    37,   101,
    42,    43,    33,    54,    32,    53,    24,    25,    46,    47,
    36,    37,   101,    42,    43,    23,    54,   146,    53,    24,
    25,    46,    47,    24,    25,   101,    42,    43,   108,    54,
    21,    53,    24,    25,    46,    47,     9,    27,   101,    42,
    43,    20,    54,   113,    53,    24,    25,    46,    47,   114,
   115,   101,    42,    43,   151,    54,   152,    53,    24,    25,
    46,    47,    36,    37,   101,    42,    43,    19,    54,   132,
    53,    24,    25,    46,    47,     9,    27,    80,    42,    43,
   nil,    39,    40,    53,    24,    25,    46,    47,    80,    42,
    43,    36,    37,    39,    40,    24,    25,    46,    47,    80,
    42,    43,   nil,   nil,   nil,    78,    24,    25,    46,    47,
    42,    43,   nil,   nil,    42,    43,    24,    25,    46,    47,
    24,    25,    46,    47,    42,    43,     9,    27,   nil,   nil,
    24,    25,    46,    47,    24,    25,    42,    43,   nil,   nil,
   nil,   nil,    24,    25,    46,    47,    65,    66,    67,    68,
    69,    70,    71 ]

racc_action_check = [
     1,    89,     1,     1,    94,     0,     0,    14,    14,   123,
    22,    22,   149,    12,    12,    80,    22,    22,    77,    61,
    61,   123,    75,   117,   149,    98,    84,     1,    84,    72,
     0,     1,   117,     1,     0,    22,     0,   101,    12,    22,
    64,    22,    12,   109,    12,    61,    53,    53,    53,    53,
    63,    53,    29,    29,    53,    53,    53,    53,    29,    29,
    23,    23,    23,    23,    62,    23,    53,    53,    23,    23,
    23,    23,   112,   108,   108,   108,   108,    90,   108,    90,
    23,   108,   108,   108,   108,    57,   115,   115,   115,   115,
    55,   115,    55,   108,   115,   115,   115,   115,    35,   114,
   114,   114,   114,    56,   114,    56,   115,   114,   114,   114,
   114,    32,    32,    70,    70,    70,    34,    70,    31,   114,
    70,    70,    70,    70,    15,    15,    67,    67,    67,   120,
    67,    26,    70,    67,    67,    67,    67,    99,    99,    65,
    65,    65,    17,    65,    16,    67,    65,    65,    65,    65,
    97,    97,    71,    71,    71,    13,    71,   126,    65,    71,
    71,    71,    71,    60,    60,    68,    68,    68,   131,    68,
    11,    71,    68,    68,    68,    68,    95,    95,    69,    69,
    69,    10,    69,   145,    68,    69,    69,    69,    69,    82,
    82,   110,   110,   110,   146,   110,   147,    69,   110,   110,
   110,   110,    21,    21,    66,    66,    66,     9,    66,   111,
   110,    66,    66,    66,    66,   122,   122,   113,   113,   113,
   nil,   122,   122,    66,   113,   113,   113,   113,   125,   125,
   125,   121,   121,   150,   150,   125,   125,   125,   125,    54,
    54,    54,   nil,   nil,   nil,    54,    54,    54,    54,    54,
    88,    88,   nil,   nil,    96,    96,    88,    88,    88,    88,
    96,    96,    96,    96,   141,   141,    20,    20,   nil,   nil,
   141,   141,   141,   141,    20,    20,   139,   139,   nil,   nil,
   nil,   nil,   139,   139,   139,   139,    52,    52,    52,    52,
    52,    52,    52 ]

racc_action_pointer = [
     3,     0,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   204,
   156,   168,    11,   125,    -3,   122,   110,   142,   nil,   nil,
   264,   196,     8,    58,   nil,   nil,    99,   nil,   nil,    50,
   nil,    88,   109,   nil,    90,    72,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   271,    44,   236,    68,    81,    83,   nil,   nil,
   153,    13,    39,    16,     6,   136,   201,   123,   162,   175,
   110,   149,    15,   nil,   nil,     8,   nil,     4,   nil,   nil,
   -10,   nil,   161,   nil,     4,   nil,   nil,   nil,   246,    -2,
    55,   nil,   nil,   nil,     2,   174,   250,   144,    21,   131,
   nil,    12,   nil,   nil,   nil,   nil,   nil,   nil,    71,    20,
   188,   186,    63,   214,    97,    84,   nil,     9,   nil,   nil,
   104,   225,   213,    -5,   nil,   225,   122,   nil,   nil,   nil,
   nil,   154,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   272,
   nil,   260,   nil,   nil,   nil,   169,   190,   173,   nil,    -2,
   225,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -90,   -90,    -1,    -5,    -6,    -7,    -8,    -9,   -10,   -90,
   -16,   -90,   -90,   -90,   -90,   -90,   -90,   -90,    -2,   -15,
   -90,   -90,   -90,   -90,   -17,   -18,   -72,   -16,   -74,   -90,
   -82,   -90,   -90,   155,   -90,   -90,   -11,   -12,   -49,   -13,
   -14,   -50,    -3,    -4,   -19,   -20,   -21,   -22,   -23,   -24,
   -25,   -26,   -41,   -90,   -90,   -68,   -70,   -90,   -77,   -81,
   -90,   -90,   -80,   -88,   -88,   -90,   -90,   -90,   -90,   -90,
   -90,   -90,   -57,   -29,   -33,   -57,   -54,   -57,   -56,   -59,
   -61,   -62,   -90,   -67,   -69,   -43,   -44,   -45,   -90,   -90,
   -71,   -73,   -83,   -75,   -90,   -90,   -90,   -86,   -90,   -86,
   -34,   -90,   -35,   -36,   -37,   -38,   -39,   -40,   -58,   -90,
   -58,   -90,   -90,   -58,   -90,   -90,   -42,   -90,   -31,   -32,
   -47,   -90,   -90,   -90,   -84,   -90,   -90,   -85,   -27,   -28,
   -51,   -57,   -53,   -55,   -60,   -63,   -65,   -64,   -66,   -90,
   -46,   -90,   -76,   -78,   -79,   -57,   -90,   -90,   -30,   -90,
   -90,   -89,   -52,   -48,   -87 ]

racc_goto_table = [
    41,     7,     7,    31,    38,    59,    81,    58,    35,    29,
    77,    56,    75,     7,    52,    72,    18,    31,   117,   109,
    62,     1,   111,     7,   112,   116,   123,   134,   124,    26,
   127,   116,    93,    22,    61,    34,   148,    18,    84,    90,
   119,    74,    97,    99,    95,    28,    55,   nil,   119,   nil,
   nil,   nil,   nil,   nil,   nil,    83,   100,   102,   103,   104,
   105,   106,   107,   nil,   nil,    81,   nil,   129,   nil,   nil,
   nil,   149,   131,   136,   138,    92,   nil,    81,   147,   nil,
   nil,   145,   nil,    31,   nil,   nil,   nil,   nil,   nil,   122,
   nil,   119,   150,   119,   nil,   nil,    74,   nil,    59,   128,
   143,   nil,    74,    74,   142,   135,   137,   nil,   nil,   nil,
    31,   nil,   nil,   nil,    83,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    83,   nil,   154 ]

racc_goto_check = [
    11,     8,     8,    12,    10,    37,    14,    11,    12,    36,
    29,    12,    19,     8,    15,    18,     2,    12,    20,    28,
    12,     1,    28,     8,    28,    24,    20,    30,    39,    13,
    39,    24,    35,     1,    34,    13,    21,     2,    23,    23,
    14,    12,    38,    38,    10,    33,    22,   nil,    14,   nil,
   nil,   nil,   nil,   nil,   nil,     8,    15,    15,    15,    15,
    15,    15,    15,   nil,   nil,    14,   nil,    19,   nil,   nil,
   nil,    20,    18,    19,    19,    13,   nil,    14,    28,   nil,
   nil,    29,   nil,    12,   nil,   nil,   nil,   nil,   nil,    36,
   nil,    14,    28,    14,   nil,   nil,    12,   nil,    37,    15,
    11,   nil,    12,    12,    10,    15,    15,   nil,   nil,   nil,
    12,   nil,   nil,   nil,     8,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     8,   nil,    11 ]

racc_goto_pointer = [
   nil,    21,    15,   nil,   nil,   nil,   nil,   nil,     1,   nil,
   -17,   -22,   -12,    15,   -48,    -9,   nil,   nil,   -38,   -41,
   -70,  -103,    23,   -17,   -59,   nil,   nil,   nil,   -53,   -44,
   -86,   nil,   nil,    30,     2,   -29,    -6,   -24,   -21,   -69 ]

racc_goto_default = [
   nil,   nil,     2,    45,     3,     4,     5,     6,    51,     8,
   125,   nil,    13,    44,    48,    73,    49,    50,   nil,   nil,
   nil,   118,   nil,   nil,    85,    86,    87,    12,   nil,   nil,
    79,    82,    15,   nil,   nil,   nil,   nil,    30,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 37, :_reduce_none,
  2, 37, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 46, :_reduce_none,
  1, 46, :_reduce_none,
  1, 47, :_reduce_none,
  1, 47, :_reduce_none,
  2, 48, :_reduce_15,
  1, 48, :_reduce_16,
  1, 49, :_reduce_17,
  1, 49, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  3, 54, :_reduce_27,
  3, 54, :_reduce_28,
  1, 54, :_reduce_29,
  3, 56, :_reduce_30,
  1, 56, :_reduce_31,
  1, 57, :_reduce_none,
  1, 55, :_reduce_33,
  3, 58, :_reduce_34,
  3, 58, :_reduce_35,
  3, 58, :_reduce_36,
  3, 58, :_reduce_37,
  3, 58, :_reduce_38,
  3, 58, :_reduce_39,
  3, 58, :_reduce_40,
  1, 58, :_reduce_none,
  2, 59, :_reduce_42,
  1, 59, :_reduce_none,
  1, 60, :_reduce_none,
  1, 60, :_reduce_none,
  3, 61, :_reduce_46,
  2, 62, :_reduce_47,
  5, 62, :_reduce_48,
  3, 63, :_reduce_49,
  3, 45, :_reduce_50,
  4, 52, :_reduce_51,
  6, 52, :_reduce_52,
  4, 52, :_reduce_53,
  2, 52, :_reduce_54,
  4, 53, :_reduce_55,
  2, 53, :_reduce_56,
  0, 64, :_reduce_none,
  1, 64, :_reduce_none,
  1, 65, :_reduce_none,
  3, 65, :_reduce_60,
  1, 67, :_reduce_61,
  1, 67, :_reduce_none,
  3, 66, :_reduce_63,
  3, 66, :_reduce_64,
  3, 66, :_reduce_65,
  3, 66, :_reduce_66,
  1, 66, :_reduce_67,
  3, 40, :_reduce_68,
  4, 40, :_reduce_69,
  3, 41, :_reduce_70,
  4, 41, :_reduce_71,
  2, 42, :_reduce_72,
  4, 42, :_reduce_73,
  2, 43, :_reduce_none,
  4, 43, :_reduce_none,
  6, 68, :_reduce_76,
  2, 69, :_reduce_77,
  3, 71, :_reduce_none,
  4, 70, :_reduce_79,
  1, 70, :_reduce_80,
  2, 72, :_reduce_none,
  1, 72, :_reduce_none,
  3, 73, :_reduce_83,
  6, 44, :_reduce_84,
  6, 44, :_reduce_85,
  0, 75, :_reduce_none,
  4, 75, :_reduce_87,
  0, 74, :_reduce_none,
  4, 74, :_reduce_89 ]

racc_reduce_n = 90

racc_shift_n = 155

racc_token_table = {
  false => 0,
  :error => 1,
  :SCOPE => 2,
  :IDENTIFIER => 3,
  :INTEGER => 4,
  :FLOAT => 5,
  :DO => 6,
  "{" => 7,
  :END => 8,
  "}" => 9,
  :DOUBLE_QUOTED => 10,
  :SINGLE_QUOTED => 11,
  :BOOLEAN => 12,
  :UNDEF => 13,
  "," => 14,
  "^" => 15,
  "*" => 16,
  "/" => 17,
  "+" => 18,
  "-" => 19,
  :OR => 20,
  :AND => 21,
  "[" => 22,
  "]" => 23,
  "." => 24,
  "(" => 25,
  ")" => 26,
  :WITH => 27,
  ":" => 28,
  :HASH_ROCKET => 29,
  "=" => 30,
  :INCLUDE => 31,
  :INTO => 32,
  :IMPORT => 33,
  :FROM => 34,
  :TO => 35 }

racc_nt_base = 36

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "SCOPE",
  "IDENTIFIER",
  "INTEGER",
  "FLOAT",
  "DO",
  "\"{\"",
  "END",
  "\"}\"",
  "DOUBLE_QUOTED",
  "SINGLE_QUOTED",
  "BOOLEAN",
  "UNDEF",
  "\",\"",
  "\"^\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "OR",
  "AND",
  "\"[\"",
  "\"]\"",
  "\".\"",
  "\"(\"",
  "\")\"",
  "WITH",
  "\":\"",
  "HASH_ROCKET",
  "\"=\"",
  "INCLUDE",
  "INTO",
  "IMPORT",
  "FROM",
  "TO",
  "$start",
  "dsl",
  "config",
  "number",
  "assignment",
  "connection",
  "include",
  "import",
  "definition",
  "with",
  "block_begin",
  "block_end",
  "literal",
  "string",
  "scalar",
  "value",
  "array",
  "hash",
  "values",
  "reference",
  "parameters",
  "parameter",
  "expression",
  "selectors",
  "selector",
  "array_selector",
  "function_selector",
  "with_scope_do",
  "optional_comma",
  "hashpairs",
  "hashpair",
  "hashkey",
  "import_with_scope_begin",
  "import_with_scope_end",
  "datasource",
  "import_block",
  "import_statements",
  "import_statement",
  "iterator",
  "definition_block" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

module_eval(<<'.,.,', 'dsl.y', 42)
  def _reduce_15(val, _values, result)
     result = "#{val[0]}#{val[1]}"
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 43)
  def _reduce_16(val, _values, result)
     result = "#{val[0]}"
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 47)
  def _reduce_17(val, _values, result)
     result = interpolate(val[0])
    result
  end
.,.,

# reduce 18 omitted

# reduce 19 omitted

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

module_eval(<<'.,.,', 'dsl.y', 66)
  def _reduce_27(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 67)
  def _reduce_28(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 68)
  def _reduce_29(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 72)
  def _reduce_30(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 73)
  def _reduce_31(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

# reduce 32 omitted

module_eval(<<'.,.,', 'dsl.y', 81)
  def _reduce_33(val, _values, result)
    result = reference(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 85)
  def _reduce_34(val, _values, result)
     result = power(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 86)
  def _reduce_35(val, _values, result)
     result = multiply(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 87)
  def _reduce_36(val, _values, result)
     result = divide(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 88)
  def _reduce_37(val, _values, result)
     result = add(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 89)
  def _reduce_38(val, _values, result)
     result = subtract(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 90)
  def _reduce_39(val, _values, result)
     result = do_or(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 91)
  def _reduce_40(val, _values, result)
     result = do_and(val[0],val[2])
    result
  end
.,.,

# reduce 41 omitted

module_eval(<<'.,.,', 'dsl.y', 99)
  def _reduce_42(val, _values, result)
     result =val.join
    result
  end
.,.,

# reduce 43 omitted

# reduce 44 omitted

# reduce 45 omitted

module_eval(<<'.,.,', 'dsl.y', 109)
  def _reduce_46(val, _values, result)
     result = val[0] + to_param(val[1]) +  val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 113)
  def _reduce_47(val, _values, result)
     result = val.join
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 114)
  def _reduce_48(val, _values, result)
     result = val[0] + val[1] + val[2] + to_param(val[3]) +  val[4]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 121)
  def _reduce_49(val, _values, result)
     push_scope(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 125)
  def _reduce_50(val, _values, result)
     pop_scope 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 132)
  def _reduce_51(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 133)
  def _reduce_52(val, _values, result)
     result = val[3].unshift(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 134)
  def _reduce_53(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 135)
  def _reduce_54(val, _values, result)
     result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 142)
  def _reduce_55(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 143)
  def _reduce_56(val, _values, result)
     result = MethodHash.new
    result
  end
.,.,

# reduce 57 omitted

# reduce 58 omitted

# reduce 59 omitted

module_eval(<<'.,.,', 'dsl.y', 153)
  def _reduce_60(val, _values, result)
     result.merge!(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 157)
  def _reduce_61(val, _values, result)
     result = val[0].to_sym
    result
  end
.,.,

# reduce 62 omitted

module_eval(<<'.,.,', 'dsl.y', 162)
  def _reduce_63(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 163)
  def _reduce_64(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 164)
  def _reduce_65(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 165)
  def _reduce_66(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 166)
  def _reduce_67(val, _values, result)
     result = MethodHash[val[0].object_id, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 173)
  def _reduce_68(val, _values, result)
     assign(val[0], val[2], nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 174)
  def _reduce_69(val, _values, result)
     assign(val[0], val[2], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 178)
  def _reduce_70(val, _values, result)
     connect(val[0], val[2], nil)
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 179)
  def _reduce_71(val, _values, result)
     connect(val[0], val[2], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 186)
  def _reduce_72(val, _values, result)
     include_file(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 187)
  def _reduce_73(val, _values, result)
     include_file(val[1], val[3])
    result
  end
.,.,

# reduce 74 omitted

# reduce 75 omitted

module_eval(<<'.,.,', 'dsl.y', 199)
  def _reduce_76(val, _values, result)
     push_scope(val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 203)
  def _reduce_77(val, _values, result)
     pop_scope
    result
  end
.,.,

# reduce 78 omitted

module_eval(<<'.,.,', 'dsl.y', 210)
  def _reduce_79(val, _values, result)
     datasource( val[0], *val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 211)
  def _reduce_80(val, _values, result)
     datasource( val[0], *[])
    result
  end
.,.,

# reduce 81 omitted

# reduce 82 omitted

module_eval(<<'.,.,', 'dsl.y', 220)
  def _reduce_83(val, _values, result)
     import(val[0], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 228)
  def _reduce_84(val, _values, result)
     result = define(val[0], val[2], val[5], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 230)
  def _reduce_85(val, _values, result)
     result = define(val[0], val[2], val[5], val[4])
    result
  end
.,.,

# reduce 86 omitted

module_eval(<<'.,.,', 'dsl.y', 236)
  def _reduce_87(val, _values, result)
     result = val[1]
    result
  end
.,.,

# reduce 88 omitted

module_eval(<<'.,.,', 'dsl.y', 241)
  def _reduce_89(val, _values, result)
     result = {:from => val[1], :to => val[3]}
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Dsl
  end   # module Connect
