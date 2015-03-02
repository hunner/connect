#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

###### racc/parser.rb begin
unless $".index 'racc/parser.rb'
$".push 'racc/parser.rb'
self.class.module_eval(<<'...end racc/parser.rb/module_eval...', 'racc/parser.rb', 1)
#
# $Id: a7af944d201a32a63d2536cdd589d8e9910848e0 $
#
# Copyright (c) 1999-2006 Minero Aoki
#
# This program is free software.
# You can distribute/modify this program under the same terms of ruby.
#
# As a special exception, when this code is copied by Racc
# into a Racc output file, you may use that output file
# without restriction.
#

require 'racc/info'

unless defined?(NotImplementedError)
  NotImplementedError = NotImplementError # :nodoc:
end

module Racc
  class ParseError < StandardError; end
end
unless defined?(::ParseError)
  ParseError = Racc::ParseError
end

# Racc is a LALR(1) parser generator.
# It is written in Ruby itself, and generates Ruby programs.
#
# == Command-line Reference
#
#     racc [-o<var>filename</var>] [--output-file=<var>filename</var>]
#          [-e<var>rubypath</var>] [--embedded=<var>rubypath</var>]
#          [-v] [--verbose]
#          [-O<var>filename</var>] [--log-file=<var>filename</var>]
#          [-g] [--debug]
#          [-E] [--embedded]
#          [-l] [--no-line-convert]
#          [-c] [--line-convert-all]
#          [-a] [--no-omit-actions]
#          [-C] [--check-only]
#          [-S] [--output-status]
#          [--version] [--copyright] [--help] <var>grammarfile</var>
#
# [+filename+]
#   Racc grammar file. Any extention is permitted.
# [-o+outfile+, --output-file=+outfile+]
#   A filename for output. default is <+filename+>.tab.rb
# [-O+filename+, --log-file=+filename+]
#   Place logging output in file +filename+.
#   Default log file name is <+filename+>.output.
# [-e+rubypath+, --executable=+rubypath+]
#   output executable file(mode 755). where +path+ is the Ruby interpreter.
# [-v, --verbose]
#   verbose mode. create +filename+.output file, like yacc's y.output file.
# [-g, --debug]
#   add debug code to parser class. To display debuggin information,
#   use this '-g' option and set @yydebug true in parser class.
# [-E, --embedded]
#   Output parser which doesn't need runtime files (racc/parser.rb).
# [-C, --check-only]
#   Check syntax of racc grammer file and quit.
# [-S, --output-status]
#   Print messages time to time while compiling.
# [-l, --no-line-convert]
#   turns off line number converting.
# [-c, --line-convert-all]
#   Convert line number of actions, inner, header and footer.
# [-a, --no-omit-actions]
#   Call all actions, even if an action is empty.
# [--version]
#   print Racc version and quit.
# [--copyright]
#   Print copyright and quit.
# [--help]
#   Print usage and quit.
#
# == Generating Parser Using Racc
#
# To compile Racc grammar file, simply type:
#
#   $ racc parse.y
#
# This creates Ruby script file "parse.tab.y". The -o option can change the output filename.
#
# == Writing A Racc Grammar File
#
# If you want your own parser, you have to write a grammar file.
# A grammar file contains the name of your parser class, grammar for the parser,
# user code, and anything else.
# When writing a grammar file, yacc's knowledge is helpful.
# If you have not used yacc before, Racc is not too difficult.
#
# Here's an example Racc grammar file.
#
#   class Calcparser
#   rule
#     target: exp { print val[0] }
#
#     exp: exp '+' exp
#        | exp '*' exp
#        | '(' exp ')'
#        | NUMBER
#   end
#
# Racc grammar files resemble yacc files.
# But (of course), this is Ruby code.
# yacc's $$ is the 'result', $0, $1... is
# an array called 'val', and $-1, $-2... is an array called '_values'.
#
# See the {Grammar File Reference}[rdoc-ref:lib/racc/rdoc/grammar.en.rdoc] for
# more information on grammar files.
#
# == Parser
#
# Then you must prepare the parse entry method. There are two types of
# parse methods in Racc, Racc::Parser#do_parse and Racc::Parser#yyparse
#
# Racc::Parser#do_parse is simple.
#
# It's yyparse() of yacc, and Racc::Parser#next_token is yylex().
# This method must returns an array like [TOKENSYMBOL, ITS_VALUE].
# EOF is [false, false].
# (TOKENSYMBOL is a Ruby symbol (taken from String#intern) by default.
# If you want to change this, see the grammar reference.
#
# Racc::Parser#yyparse is little complicated, but useful.
# It does not use Racc::Parser#next_token, instead it gets tokens from any iterator.
#
# For example, <code>yyparse(obj, :scan)</code> causes
# calling +obj#scan+, and you can return tokens by yielding them from +obj#scan+.
#
# == Debugging
#
# When debugging, "-v" or/and the "-g" option is helpful.
#
# "-v" creates verbose log file (.output).
# "-g" creates a "Verbose Parser".
# Verbose Parser prints the internal status when parsing.
# But it's _not_ automatic.
# You must use -g option and set +@yydebug+ to +true+ in order to get output.
# -g option only creates the verbose parser.
#
# === Racc reported syntax error.
#
# Isn't there too many "end"?
# grammar of racc file is changed in v0.10.
#
# Racc does not use '%' mark, while yacc uses huge number of '%' marks..
#
# === Racc reported "XXXX conflicts".
#
# Try "racc -v xxxx.y".
# It causes producing racc's internal log file, xxxx.output.
#
# === Generated parsers does not work correctly
#
# Try "racc -g xxxx.y".
# This command let racc generate "debugging parser".
# Then set @yydebug=true in your parser.
# It produces a working log of your parser.
#
# == Re-distributing Racc runtime
#
# A parser, which is created by Racc, requires the Racc runtime module;
# racc/parser.rb.
#
# Ruby 1.8.x comes with Racc runtime module,
# you need NOT distribute Racc runtime files.
#
# If you want to include the Racc runtime module with your parser.
# This can be done by using '-E' option:
#
#   $ racc -E -omyparser.rb myparser.y
#
# This command creates myparser.rb which `includes' Racc runtime.
# Only you must do is to distribute your parser file (myparser.rb).
#
# Note: parser.rb is LGPL, but your parser is not.
# Your own parser is completely yours.
module Racc

  unless defined?(Racc_No_Extentions)
    Racc_No_Extentions = false # :nodoc:
  end

  class Parser

    Racc_Runtime_Version = ::Racc::VERSION
    Racc_Runtime_Revision = '$Id: a7af944d201a32a63d2536cdd589d8e9910848e0 $'

    Racc_Runtime_Core_Version_R = ::Racc::VERSION
    Racc_Runtime_Core_Revision_R = '$Id: a7af944d201a32a63d2536cdd589d8e9910848e0 $'.split[1]
    begin
      if RUBY_ENGINE == 'jruby'
        require 'racc/cparse-jruby.jar'
        com.headius.racc.Cparse.new.load(JRuby.runtime, false)
      else
        require 'racc/cparse'
      end
    # Racc_Runtime_Core_Version_C  = (defined in extention)
      Racc_Runtime_Core_Revision_C = Racc_Runtime_Core_Id_C.split[2]
      unless new.respond_to?(:_racc_do_parse_c, true)
        raise LoadError, 'old cparse.so'
      end
      if Racc_No_Extentions
        raise LoadError, 'selecting ruby version of racc runtime core'
      end

      Racc_Main_Parsing_Routine    = :_racc_do_parse_c # :nodoc:
      Racc_YY_Parse_Method         = :_racc_yyparse_c # :nodoc:
      Racc_Runtime_Core_Version    = Racc_Runtime_Core_Version_C # :nodoc:
      Racc_Runtime_Core_Revision   = Racc_Runtime_Core_Revision_C # :nodoc:
      Racc_Runtime_Type            = 'c' # :nodoc:
    rescue LoadError
puts $!
puts $!.backtrace
      Racc_Main_Parsing_Routine    = :_racc_do_parse_rb
      Racc_YY_Parse_Method         = :_racc_yyparse_rb
      Racc_Runtime_Core_Version    = Racc_Runtime_Core_Version_R
      Racc_Runtime_Core_Revision   = Racc_Runtime_Core_Revision_R
      Racc_Runtime_Type            = 'ruby'
    end

    def Parser.racc_runtime_type # :nodoc:
      Racc_Runtime_Type
    end

    def _racc_setup
      @yydebug = false unless self.class::Racc_debug_parser
      @yydebug = false unless defined?(@yydebug)
      if @yydebug
        @racc_debug_out = $stderr unless defined?(@racc_debug_out)
        @racc_debug_out ||= $stderr
      end
      arg = self.class::Racc_arg
      arg[13] = true if arg.size < 14
      arg
    end

    def _racc_init_sysvars
      @racc_state  = [0]
      @racc_tstack = []
      @racc_vstack = []

      @racc_t = nil
      @racc_val = nil

      @racc_read_next = true

      @racc_user_yyerror = false
      @racc_error_status = 0
    end

    # The entry point of the parser. This method is used with #next_token.
    # If Racc wants to get token (and its value), calls next_token.
    #
    # Example:
    #     def parse
    #       @q = [[1,1],
    #             [2,2],
    #             [3,3],
    #             [false, '$']]
    #       do_parse
    #     end
    #
    #     def next_token
    #       @q.shift
    #     end
    def do_parse
      __send__(Racc_Main_Parsing_Routine, _racc_setup(), false)
    end

    # The method to fetch next token.
    # If you use #do_parse method, you must implement #next_token.
    #
    # The format of return value is [TOKEN_SYMBOL, VALUE].
    # +token-symbol+ is represented by Ruby's symbol by default, e.g. :IDENT
    # for 'IDENT'.  ";" (String) for ';'.
    #
    # The final symbol (End of file) must be false.
    def next_token
      raise NotImplementedError, "#{self.class}\#next_token is not defined"
    end

    def _racc_do_parse_rb(arg, in_debug)
      action_table, action_check, action_default, action_pointer,
      _,            _,            _,              _,
      _,            _,            token_table,    * = arg

      _racc_init_sysvars
      tok = act = i = nil

      catch(:racc_end_parse) {
        while true
          if i = action_pointer[@racc_state[-1]]
            if @racc_read_next
              if @racc_t != 0   # not EOF
                tok, @racc_val = next_token()
                unless tok      # EOF
                  @racc_t = 0
                else
                  @racc_t = (token_table[tok] or 1)   # error token
                end
                racc_read_token(@racc_t, tok, @racc_val) if @yydebug
                @racc_read_next = false
              end
            end
            i += @racc_t
            unless i >= 0 and
                   act = action_table[i] and
                   action_check[i] == @racc_state[-1]
              act = action_default[@racc_state[-1]]
            end
          else
            act = action_default[@racc_state[-1]]
          end
          while act = _racc_evalact(act, arg)
            ;
          end
        end
      }
    end

    # Another entry point for the parser.
    # If you use this method, you must implement RECEIVER#METHOD_ID method.
    #
    # RECEIVER#METHOD_ID is a method to get next token.
    # It must 'yield' the token, which format is [TOKEN-SYMBOL, VALUE].
    def yyparse(recv, mid)
      __send__(Racc_YY_Parse_Method, recv, mid, _racc_setup(), false)
    end

    def _racc_yyparse_rb(recv, mid, arg, c_debug)
      action_table, action_check, action_default, action_pointer,
      _,            _,            _,              _,
      _,            _,            token_table,    * = arg

      _racc_init_sysvars

      catch(:racc_end_parse) {
        until i = action_pointer[@racc_state[-1]]
          while act = _racc_evalact(action_default[@racc_state[-1]], arg)
            ;
          end
        end
        recv.__send__(mid) do |tok, val|
          unless tok
            @racc_t = 0
          else
            @racc_t = (token_table[tok] or 1)   # error token
          end
          @racc_val = val
          @racc_read_next = false

          i += @racc_t
          unless i >= 0 and
                 act = action_table[i] and
                 action_check[i] == @racc_state[-1]
            act = action_default[@racc_state[-1]]
          end
          while act = _racc_evalact(act, arg)
            ;
          end

          while !(i = action_pointer[@racc_state[-1]]) ||
                ! @racc_read_next ||
                @racc_t == 0  # $
            unless i and i += @racc_t and
                   i >= 0 and
                   act = action_table[i] and
                   action_check[i] == @racc_state[-1]
              act = action_default[@racc_state[-1]]
            end
            while act = _racc_evalact(act, arg)
              ;
            end
          end
        end
      }
    end

    ###
    ### common
    ###

    def _racc_evalact(act, arg)
      action_table, action_check, _, action_pointer,
      _,            _,            _, _,
      _,            _,            _, shift_n,
      reduce_n,     * = arg
      nerr = 0   # tmp

      if act > 0 and act < shift_n
        #
        # shift
        #
        if @racc_error_status > 0
          @racc_error_status -= 1 unless @racc_t == 1   # error token
        end
        @racc_vstack.push @racc_val
        @racc_state.push act
        @racc_read_next = true
        if @yydebug
          @racc_tstack.push @racc_t
          racc_shift @racc_t, @racc_tstack, @racc_vstack
        end

      elsif act < 0 and act > -reduce_n
        #
        # reduce
        #
        code = catch(:racc_jump) {
          @racc_state.push _racc_do_reduce(arg, act)
          false
        }
        if code
          case code
          when 1 # yyerror
            @racc_user_yyerror = true   # user_yyerror
            return -reduce_n
          when 2 # yyaccept
            return shift_n
          else
            raise '[Racc Bug] unknown jump code'
          end
        end

      elsif act == shift_n
        #
        # accept
        #
        racc_accept if @yydebug
        throw :racc_end_parse, @racc_vstack[0]

      elsif act == -reduce_n
        #
        # error
        #
        case @racc_error_status
        when 0
          unless arg[21]    # user_yyerror
            nerr += 1
            on_error @racc_t, @racc_val, @racc_vstack
          end
        when 3
          if @racc_t == 0   # is $
            throw :racc_end_parse, nil
          end
          @racc_read_next = true
        end
        @racc_user_yyerror = false
        @racc_error_status = 3
        while true
          if i = action_pointer[@racc_state[-1]]
            i += 1   # error token
            if  i >= 0 and
                (act = action_table[i]) and
                action_check[i] == @racc_state[-1]
              break
            end
          end
          throw :racc_end_parse, nil if @racc_state.size <= 1
          @racc_state.pop
          @racc_vstack.pop
          if @yydebug
            @racc_tstack.pop
            racc_e_pop @racc_state, @racc_tstack, @racc_vstack
          end
        end
        return act

      else
        raise "[Racc Bug] unknown action #{act.inspect}"
      end

      racc_next_state(@racc_state[-1], @racc_state) if @yydebug

      nil
    end

    def _racc_do_reduce(arg, act)
      _,          _,            _,            _,
      goto_table, goto_check,   goto_default, goto_pointer,
      nt_base,    reduce_table, _,            _,
      _,          use_result,   * = arg

      state = @racc_state
      vstack = @racc_vstack
      tstack = @racc_tstack

      i = act * -3
      len       = reduce_table[i]
      reduce_to = reduce_table[i+1]
      method_id = reduce_table[i+2]
      void_array = []

      tmp_t = tstack[-len, len] if @yydebug
      tmp_v = vstack[-len, len]
      tstack[-len, len] = void_array if @yydebug
      vstack[-len, len] = void_array
      state[-len, len]  = void_array

      # tstack must be updated AFTER method call
      if use_result
        vstack.push __send__(method_id, tmp_v, vstack, tmp_v[0])
      else
        vstack.push __send__(method_id, tmp_v, vstack)
      end
      tstack.push reduce_to

      racc_reduce(tmp_t, reduce_to, tstack, vstack) if @yydebug

      k1 = reduce_to - nt_base
      if i = goto_pointer[k1]
        i += state[-1]
        if i >= 0 and (curstate = goto_table[i]) and goto_check[i] == k1
          return curstate
        end
      end
      goto_default[k1]
    end

    # This method is called when a parse error is found.
    #
    # ERROR_TOKEN_ID is an internal ID of token which caused error.
    # You can get string representation of this ID by calling
    # #token_to_str.
    #
    # ERROR_VALUE is a value of error token.
    #
    # value_stack is a stack of symbol values.
    # DO NOT MODIFY this object.
    #
    # This method raises ParseError by default.
    #
    # If this method returns, parsers enter "error recovering mode".
    def on_error(t, val, vstack)
      raise ParseError, sprintf("\nparse error on value %s (%s)",
                                val.inspect, token_to_str(t) || '?')
    end

    # Enter error recovering mode.
    # This method does not call #on_error.
    def yyerror
      throw :racc_jump, 1
    end

    # Exit parser.
    # Return value is Symbol_Value_Stack[0].
    def yyaccept
      throw :racc_jump, 2
    end

    # Leave error recovering mode.
    def yyerrok
      @racc_error_status = 0
    end

    # For debugging output
    def racc_read_token(t, tok, val)
      @racc_debug_out.print 'read    '
      @racc_debug_out.print tok.inspect, '(', racc_token2str(t), ') '
      @racc_debug_out.puts val.inspect
      @racc_debug_out.puts
    end

    def racc_shift(tok, tstack, vstack)
      @racc_debug_out.puts "shift   #{racc_token2str tok}"
      racc_print_stacks tstack, vstack
      @racc_debug_out.puts
    end

    def racc_reduce(toks, sim, tstack, vstack)
      out = @racc_debug_out
      out.print 'reduce '
      if toks.empty?
        out.print ' <none>'
      else
        toks.each {|t| out.print ' ', racc_token2str(t) }
      end
      out.puts " --> #{racc_token2str(sim)}"
      racc_print_stacks tstack, vstack
      @racc_debug_out.puts
    end

    def racc_accept
      @racc_debug_out.puts 'accept'
      @racc_debug_out.puts
    end

    def racc_e_pop(state, tstack, vstack)
      @racc_debug_out.puts 'error recovering mode: pop token'
      racc_print_states state
      racc_print_stacks tstack, vstack
      @racc_debug_out.puts
    end

    def racc_next_state(curstate, state)
      @racc_debug_out.puts  "goto    #{curstate}"
      racc_print_states state
      @racc_debug_out.puts
    end

    def racc_print_stacks(t, v)
      out = @racc_debug_out
      out.print '        ['
      t.each_index do |i|
        out.print ' (', racc_token2str(t[i]), ' ', v[i].inspect, ')'
      end
      out.puts ' ]'
    end

    def racc_print_states(s)
      out = @racc_debug_out
      out.print '        ['
      s.each {|st| out.print ' ', st }
      out.puts ' ]'
    end

    def racc_token2str(tok)
      self.class::Racc_token_to_s_table[tok] or
          raise "[Racc Bug] can't convert token #{tok} to string"
    end

    # Convert internal ID of token symbol to the string.
    def token_to_str(t)
      self.class::Racc_token_to_s_table[t]
    end

  end

end

...end racc/parser.rb/module_eval...
end
###### racc/parser.rb end

  require 'dsl/dsl'
  require 'dsl/lexer'

class Dsl < Racc::Parser

module_eval(<<'...end dsl.y/module_eval...', 'dsl.y', 161)

  def parse(input)
    scan_str(input)
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
    15,    66,    69,     8,     8,     9,     9,    84,     8,    30,
     9,     8,     8,     9,     9,     8,    21,     9,    80,    22,
    29,   102,   101,    27,    28,    23,    24,    22,    14,    14,
    23,    24,    88,    14,    85,    86,    14,    14,    22,    89,
    14,    31,    32,     8,    22,    81,    93,    43,    94,    26,
    20,    23,    24,    35,    36,    31,    32,     8,    17,    47,
   103,    43,    42,   -45,    80,    23,    24,    35,    36,    31,
    32,     8,    66,    70,   107,    43,    42,    58,   108,    23,
    24,    35,    36,    31,    32,     8,    84,    84,   111,    43,
    42,   -45,   112,    23,    24,    35,    36,    31,    32,     8,
   113,   nil,   nil,    43,    42,   nil,   nil,    23,    24,    35,
    36,    31,    32,     8,   nil,   nil,   nil,    43,    42,   nil,
   nil,    23,    24,    35,    36,    31,    32,     8,   nil,   nil,
   nil,    43,    42,   nil,   nil,    23,    24,    35,    36,    31,
    32,     8,   nil,   nil,   nil,    43,    42,   nil,   nil,    23,
    24,    35,    36,    31,    32,     8,   nil,   nil,   nil,    43,
    42,   nil,   nil,    23,    24,    35,    36,    31,    32,     8,
   nil,   nil,   nil,    43,    42,   nil,   nil,    23,    24,    35,
    36,    31,    32,     8,   nil,   nil,   nil,    43,    42,   nil,
   nil,    23,    24,    35,    36,    31,    32,     8,   nil,   nil,
   nil,    43,    42,   nil,   nil,    23,    24,    35,    36,    31,
    32,     8,   nil,   nil,   nil,    43,    42,   nil,   nil,    23,
    24,    35,    36,    31,    32,   nil,   nil,   nil,    31,    32,
    42,   nil,    63,    23,    24,    35,    36,    63,    23,    24,
    35,    36,    31,    32,   nil,   nil,   nil,   nil,    31,    32,
   nil,    63,    23,    24,    35,    36,    61,    63,    23,    24,
    35,    36,    48,    49,    50,    51,    52,    53,    54 ]

racc_action_check = [
     1,    45,    46,    19,     1,    19,     1,    60,    10,    19,
    10,    11,     0,    11,     0,    18,    13,    18,    56,    13,
    18,    87,    87,    17,    17,    22,    22,    45,    19,     1,
    14,    14,    69,    10,    65,    65,    11,     0,    72,    79,
    18,    80,    80,    80,    55,    57,    82,    80,    83,    15,
    12,    80,    80,    80,    80,    42,    42,    42,     9,    25,
    88,    42,    80,    80,    92,    42,    42,    42,    42,    81,
    81,    81,    44,    47,   103,    81,    42,    42,   104,    81,
    81,    81,    81,    53,    53,    53,   105,   106,   107,    53,
    81,    81,   109,    53,    53,    53,    53,    85,    85,    85,
   110,   nil,   nil,    85,    53,   nil,   nil,    85,    85,    85,
    85,    21,    21,    21,   nil,   nil,   nil,    21,    85,   nil,
   nil,    21,    21,    21,    21,    52,    52,    52,   nil,   nil,
   nil,    52,    21,   nil,   nil,    52,    52,    52,    52,    51,
    51,    51,   nil,   nil,   nil,    51,    52,   nil,   nil,    51,
    51,    51,    51,    50,    50,    50,   nil,   nil,   nil,    50,
    51,   nil,   nil,    50,    50,    50,    50,    86,    86,    86,
   nil,   nil,   nil,    86,    50,   nil,   nil,    86,    86,    86,
    86,    49,    49,    49,   nil,   nil,   nil,    49,    86,   nil,
   nil,    49,    49,    49,    49,    48,    48,    48,   nil,   nil,
   nil,    48,    49,   nil,   nil,    48,    48,    48,    48,    54,
    54,    54,   nil,   nil,   nil,    54,    48,   nil,   nil,    54,
    54,    54,    54,    84,    84,   nil,   nil,   nil,   102,   102,
    54,   nil,    84,    84,    84,    84,    84,   102,   102,   102,
   102,   102,   101,   101,   nil,   nil,   nil,   nil,    43,    43,
   nil,   101,   101,   101,   101,   101,    43,    43,    43,    43,
    43,    43,    41,    41,    41,    41,    41,    41,    41 ]

racc_action_pointer = [
     8,     0,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    54,
     4,     7,    39,   -12,    18,    49,   nil,    16,    11,    -1,
   nil,   109,    13,   nil,   nil,    29,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   246,    53,   246,    67,    -4,   -30,    69,   193,   179,
   151,   137,   123,    81,   207,    13,    -7,    20,   nil,   nil,
   -18,   nil,   nil,   nil,   nil,     8,   nil,   nil,   nil,    -1,
   nil,   nil,     7,   nil,   nil,   nil,   nil,   nil,   nil,    15,
    39,    67,    22,    38,   221,    95,   165,    14,    58,   nil,
   nil,   nil,    39,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   240,   226,    40,    54,    61,    62,    86,   nil,    82,
    91,   nil,   nil,   nil ]

racc_action_default = [
   -10,   -10,    -1,    -5,    -6,    -7,    -8,    -9,   -11,   -67,
   -10,   -10,   -67,   -67,   -67,   -67,    -2,   -67,   -10,   -10,
   -18,   -10,   -67,   -19,   -20,   -59,   114,   -14,   -15,   -16,
   -17,    -3,    -4,   -21,   -22,   -23,   -24,   -25,   -26,   -27,
   -28,   -37,   -10,   -67,   -12,   -12,   -67,   -67,   -10,   -10,
   -10,   -10,   -10,   -10,   -10,   -29,   -44,   -44,   -41,   -56,
   -44,   -43,   -46,   -48,   -49,   -67,   -13,   -57,   -58,   -65,
   -60,   -30,   -67,   -31,   -32,   -33,   -34,   -35,   -36,   -67,
   -10,   -10,   -67,   -67,   -45,   -10,   -10,   -62,   -67,   -38,
   -54,   -55,   -44,   -40,   -42,   -47,   -50,   -52,   -51,   -53,
   -61,   -67,   -67,   -67,   -67,   -44,   -44,   -67,   -39,   -67,
   -67,   -66,   -63,   -64 ]

racc_goto_table = [
    13,    13,    41,     1,    60,    57,    64,    56,    79,    82,
    13,    13,    83,    18,    19,    25,    67,    68,    13,    13,
    16,    45,    95,    46,    44,    87,   100,   nil,   nil,    71,
    73,    74,    75,    76,    77,    78,   nil,    16,    16,   nil,
   nil,   nil,    55,    91,   104,   nil,    92,    64,    97,    99,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   109,   110,     6,
     6,    90,   105,   106,    64,    64,    96,    98,   nil,     6,
     6,   nil,   nil,   nil,   nil,   nil,   nil,     6,     6,   nil,
    55,   nil,   nil,   nil,   nil,    55,    55 ]

racc_goto_check = [
    13,    13,    16,     1,    23,    19,    15,    21,    22,    22,
    13,    13,    22,     1,     1,    14,    10,    10,    13,    13,
     2,    13,    24,    14,    20,    26,    27,   nil,   nil,    16,
    16,    16,    16,    16,    16,    16,   nil,     2,     2,   nil,
   nil,   nil,    13,    19,    22,   nil,    21,    15,    19,    19,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    22,    22,     7,
     7,    16,    23,    23,    15,    15,    16,    16,   nil,     7,
     7,   nil,   nil,   nil,   nil,   nil,   nil,     7,     7,   nil,
    13,   nil,   nil,   nil,   nil,    13,    13 ]

racc_goto_pointer = [
   nil,     3,    19,   nil,   nil,   nil,   nil,    59,   nil,   nil,
   -28,   nil,   nil,     0,     1,   -37,   -19,   nil,   nil,   -37,
     3,   -35,   -48,   -39,   -62,   nil,   -44,   -61 ]

racc_goto_default = [
   nil,   nil,     2,    34,     3,     4,     5,    40,     7,    12,
   nil,    10,    11,    72,    33,    37,    59,    38,    39,   nil,
   nil,   nil,   nil,   nil,    62,    65,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 36, :_reduce_none,
  2, 36, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  0, 44, :_reduce_none,
  1, 44, :_reduce_none,
  0, 45, :_reduce_none,
  1, 45, :_reduce_none,
  3, 46, :_reduce_14,
  3, 47, :_reduce_15,
  3, 43, :_reduce_16,
  3, 43, :_reduce_17,
  2, 48, :_reduce_18,
  1, 49, :_reduce_19,
  1, 49, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 51, :_reduce_none,
  1, 54, :_reduce_29,
  3, 55, :_reduce_30,
  3, 55, :_reduce_31,
  3, 55, :_reduce_32,
  3, 55, :_reduce_33,
  3, 55, :_reduce_34,
  3, 55, :_reduce_35,
  3, 55, :_reduce_36,
  1, 55, :_reduce_none,
  4, 52, :_reduce_38,
  6, 52, :_reduce_39,
  4, 52, :_reduce_40,
  2, 52, :_reduce_41,
  4, 53, :_reduce_42,
  2, 53, :_reduce_43,
  0, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 58, :_reduce_none,
  3, 58, :_reduce_47,
  1, 60, :_reduce_48,
  1, 60, :_reduce_none,
  3, 59, :_reduce_50,
  3, 59, :_reduce_51,
  3, 59, :_reduce_52,
  3, 59, :_reduce_53,
  3, 56, :_reduce_54,
  3, 56, :_reduce_55,
  1, 56, :_reduce_56,
  4, 39, :_reduce_57,
  4, 40, :_reduce_58,
  2, 41, :_reduce_59,
  4, 41, :_reduce_60,
  6, 42, :_reduce_61,
  0, 62, :_reduce_none,
  4, 62, :_reduce_63,
  4, 62, :_reduce_64,
  0, 61, :_reduce_none,
  4, 61, :_reduce_66 ]

racc_reduce_n = 67

racc_shift_n = 114

racc_token_table = {
  false => 0,
  :error => 1,
  :INTEGER => 2,
  :FLOAT => 3,
  :SCOPE => 4,
  :SELECTOR => 5,
  :WITH => 6,
  :DO => 7,
  "{" => 8,
  :END => 9,
  "}" => 10,
  :IDENTIFIER => 11,
  :DOUBLE_QUOTED => 12,
  :SINGLE_QUOTED => 13,
  :BOOLEAN => 14,
  :UNDEF => 15,
  "^" => 16,
  "*" => 17,
  "/" => 18,
  "+" => 19,
  "-" => 20,
  :OR => 21,
  :AND => 22,
  "[" => 23,
  "]" => 24,
  "," => 25,
  ":" => 26,
  :HASH_ROCKET => 27,
  "=" => 28,
  :INCLUDE => 29,
  :INTO => 30,
  "(" => 31,
  ")" => 32,
  :FROM => 33,
  :TO => 34 }

racc_nt_base = 35

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
  "INTEGER",
  "FLOAT",
  "SCOPE",
  "SELECTOR",
  "WITH",
  "DO",
  "\"{\"",
  "END",
  "\"}\"",
  "IDENTIFIER",
  "DOUBLE_QUOTED",
  "SINGLE_QUOTED",
  "BOOLEAN",
  "UNDEF",
  "\"^\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "OR",
  "AND",
  "\"[\"",
  "\"]\"",
  "\",\"",
  "\":\"",
  "HASH_ROCKET",
  "\"=\"",
  "INCLUDE",
  "INTO",
  "\"(\"",
  "\")\"",
  "FROM",
  "TO",
  "$start",
  "dsl",
  "config",
  "number",
  "assignment",
  "connection",
  "include_file",
  "definition",
  "default_scope",
  "scope",
  "selector",
  "with_scope_do",
  "with_scope_bracket",
  "literal",
  "string",
  "scalar",
  "value",
  "array",
  "hash",
  "reference",
  "expression",
  "values",
  "optional_comma",
  "hashpairs",
  "hashpair",
  "hashkey",
  "iterator",
  "block" ]

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

module_eval(<<'.,.,', 'dsl.y', 32)
  def _reduce_14(val, _values, result)
     push_scope(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 36)
  def _reduce_15(val, _values, result)
     push_scope(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 41)
  def _reduce_16(val, _values, result)
     pop_scope 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 42)
  def _reduce_17(val, _values, result)
     pop_scope 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 47)
  def _reduce_18(val, _values, result)
     result = "#{val[0]}#{val[1]}"
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 51)
  def _reduce_19(val, _values, result)
     result = interpolate(val[0])
    result
  end
.,.,

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

module_eval(<<'.,.,', 'dsl.y', 70)
  def _reduce_29(val, _values, result)
    result = reference(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 74)
  def _reduce_30(val, _values, result)
     result = power(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 75)
  def _reduce_31(val, _values, result)
     result = multiply(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 76)
  def _reduce_32(val, _values, result)
     result = divide(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 77)
  def _reduce_33(val, _values, result)
     result = add(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 78)
  def _reduce_34(val, _values, result)
     result = subtract(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 79)
  def _reduce_35(val, _values, result)
     result = do_or(val[0],val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 80)
  def _reduce_36(val, _values, result)
     result = do_and(val[0],val[2])
    result
  end
.,.,

# reduce 37 omitted

module_eval(<<'.,.,', 'dsl.y', 85)
  def _reduce_38(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 86)
  def _reduce_39(val, _values, result)
     result = val[3].unshift(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 87)
  def _reduce_40(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 88)
  def _reduce_41(val, _values, result)
     result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 92)
  def _reduce_42(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 93)
  def _reduce_43(val, _values, result)
     result = MethodHash.new
    result
  end
.,.,

# reduce 44 omitted

# reduce 45 omitted

# reduce 46 omitted

module_eval(<<'.,.,', 'dsl.y', 103)
  def _reduce_47(val, _values, result)
     result.merge!(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 107)
  def _reduce_48(val, _values, result)
     result = val[0].to_sym
    result
  end
.,.,

# reduce 49 omitted

module_eval(<<'.,.,', 'dsl.y', 112)
  def _reduce_50(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 113)
  def _reduce_51(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 114)
  def _reduce_52(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 115)
  def _reduce_53(val, _values, result)
     result = MethodHash[val[0], val[2]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 119)
  def _reduce_54(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 120)
  def _reduce_55(val, _values, result)
     result = val[0] << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 121)
  def _reduce_56(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 125)
  def _reduce_57(val, _values, result)
     assign(val[0], val[2], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 129)
  def _reduce_58(val, _values, result)
     connect(val[0], val[2], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 133)
  def _reduce_59(val, _values, result)
     include_file(val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 134)
  def _reduce_60(val, _values, result)
     include_file(val[1], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 139)
  def _reduce_61(val, _values, result)
     result = define(val[0], val[2], val[5], val[4])
    result
  end
.,.,

# reduce 62 omitted

module_eval(<<'.,.,', 'dsl.y', 144)
  def _reduce_63(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'dsl.y', 145)
  def _reduce_64(val, _values, result)
     result = val[1]
    result
  end
.,.,

# reduce 65 omitted

module_eval(<<'.,.,', 'dsl.y', 150)
  def _reduce_66(val, _values, result)
     result = {:from => val[1], :to => val[3]}
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Dsl
