*vindent.txt* Navigate and Select Text by Indentations.


                                 VINDENT.VIM


==============================================================================
Contents                                                    *vindent_Contents*

    1. Introduction ......................... |vindent_Introduction|
    2. Usage ................................ |vindent_Usage|
    3. Details .............................. |vindent_Details|
        3.1 Motions ......................... |vindent_Motions|
        3.2 Text Objects .................... |vindent_Text_Objects|
		3.3 Miscellaneous ................... |vindent_Miscellaneous|
    4. License .............................. |vindent_License|
    5. Bugs and Contributing ................ |vindent_Bugs_and_Contributing|
    6. Changelog ............................ |vindent_Changelog|
    7. Credits .............................. |vindent_Credits|

==============================================================================
1. Introduction                                         *vindent_Introduction*

This plugin provides two indentation related functionalities:

1. |vindent_Motions|:
   A |motion| that moves to previous or next line with the same indentation as
   the current line.  Consists of two components:
       - |indent_prev|: move to previous line with same indent.
       - |indent_next|: move to next     line with same indent.

2. |vindent_Text_Objects|:
   Text |objects| to select text by indentation. Four variations:
       - |in_indent|: select adjacent lines with the same or more indentation.
       - |in_Indent|: select adjacent lines with same indentation.
       - |an_indent|: select |in_indent| and one extra line with less
         indentation at the beginning.
       - |an_Indent|: select |in_indent| and two extra line with less
         indentation: one at the beginning and one at the end.

==============================================================================
2. Usage                                                       *vindent_Usage*

KEYBINDING VARIABLES				*vindent_variable*

This plugin does not come with default keybindings.  You can define your own
keybindings using the following |vindent_variable|s:

- `g:vindent_motion_prev`: Keybinding to motion |indent_prev|.
- `g:vindent_motion_next`: Keybinding to motion |indent_next|.
- `g:vindent_object_ii`:   Keybinding to text object |in_indent|.
- `g:vindent_object_iI`:   Keybinding to text object |in_Indent|.
- `g:vindent_object_ai`:   Keybinding to text object |an_indent|.
- `g:vindent_object_aI`:   Keybinding to text object |an_Indent|.

For example, I have the following definitions in my |vimrc|
>
	let g:vindent_motion_prev = '[l'
	let g:vindent_motion_next = ']l'
	let g:vindent_object_ii   = 'ii'
	let g:vindent_object_iI   = 'iI'
	let g:vindent_object_ai   = 'ai'
	let g:vindent_object_aI   = 'aI'
<
If you wish not to use a certain functionality, simply leave the corresponding
keybinding variable undefined.  Note: `[l` and `]l` are common keybindings,
use |maparg()| to check if the two are already in use before copying the above
to your |vimrc|.

By default, this plugin does not assume equivalence between <Tab> and
<Space>s by values of |tabstop|, |softtabstop|, or |shiftwidth|.  However,
if you wish for this plugin to view a <Tab> as X <Space>, then set
|g:vindent_tabstop| to X.  For example, I have the following in my |vimrc|:
>
	let g:vindent_tabstop = &tabstop
<
This make vindent.vim assume the equivalence between 1 <Tab> and |tabstop|
number of spaces.

PLUGS						*vindent_plug*

Alternatively, you can create mappings using the <Plug>s provided by this
plugin if you wish to map different keybindings to different modes:

- `<Plug>(VindentMove_N_prev)`: |indent_prev| in normal mode.
- `<Plug>(VindentMove_N_next)`: |indent_next| in normal mode.
- `<Plug>(VindentMove_X_prev)`: |indent_prev| in visual mode.
- `<Plug>(VindentMove_X_next)`: |indent_next| in visual mode.
- `<Plug>(VindentMove_O_prev)`: |indent_prev| as text object.
- `<Plug>(VindentMove_O_next)`: |indent_next| as text object.

- `<PLug>(VindentObject_X_ii)`: |in_indent| in visual mode.
- `<PLug>(VindentObject_X_iI)`: |in_Indent| in visual mode.
- `<PLug>(VindentObject_X_ai)`: |an_indent| in visual mode.
- `<PLug>(VindentObject_X_aI)`: |an_Indent| in visual mode.
- `<PLug>(VindentObject_O_ii)`: |in_indent| as text object.
- `<PLug>(VindentObject_O_iI)`: |in_Indent| as text object.
- `<PLug>(VindentObject_O_ai)`: |an_indent| as text object.
- `<PLug>(VindentObject_O_aI)`: |an_Indent| as text object.

==============================================================================
3. Details                                                   *vindent_Details*

------------------------------------------------------------------------------
3.1 Motions                                                  *vindent_Motions*

"indent_prev"					*indent_prev*
		A |motion| that moves the cursor to the previous line that has
		the exact same indentation as the current line.  This motion
		works in normal mode, visual mode and as a text object.  This
		motion can take {count}.

		Keybinding defined by `g:vindent_motion_prev` is mapped to
		this motion, which consists of three |vindent_plug|s:
		    - `<Plug>(VindentMove_N_prev)`: for normal mode
		    - `<Plug>(VindentMove_X_prev)`: for visual mode
		    - `<Plug>(VindentMove_O_prev)`: for text object

		Here are some quirks about |indent_prev| and |indent_next|:
		    - The motions do nothing (cursor does not move) if the
		      current line is |empty|.
		    - The motions assume that the indentations are consistent,
		      unless |g:vindent_tabstop| is set.
		      For example, on a line indented with 1 tab,
		      |indent_prev| would not move the cursor to a line
		      indented with 8 spaces, unless |g:vindent_tabstop| is
		      set to 8.
		    - If no line with the same indentation is found, the
		      cursor does not move.
		    - If being used as a text object, these motions operate on
		      texts line-wise, like |V|.

		For example, consider the following LaTeX code: >
			 1 \begin{enumerate}
			 2
			 3     \item
			 4
			 5         Some sentence that is
			 6         split into two lines.
			 7
			 8     \item
			 9         Another sentence here.
			10
			11 \end{enumerate}
<		If cursor is on line 6, |indent_prev| moves it to lines 5.
		If cursor is on line 9, |indent_prev| moves it to lines 6.
		If cursor is on line 1, |indent_next| moves it to lines 11.
		If the keybinding `]l` is mapped to |indent_next| and the
		cursor is on line 5, then `2]l` moves the cursor to line 9.

"indent_next"					*indent_next*
		Same as |indent_prev|, but moves the cursor to the next line
		with the exact same indentation as the current line.

		Keybinding defined by `g:vindent_motion_next` is mapped to
		this motion, which consists of three |vindent_plug|s:
		    - `<Plug>(VindentMove_N_next)`: for normal mode
		    - `<Plug>(VindentMove_X_next)`: for visual mode
		    - `<Plug>(VindentMove_O_next)`: for text object

		See |indent_prev| for more details and example.

------------------------------------------------------------------------------
3.2 Test Objects                                        *vindent_Text_Objects*

"in_indent"					*in_indent*
		A text |object| that selects adjacent lines with the same or
		more indentations as the current line.  This text object
		select text line-wise, like |V|.  This text object does NOT
		take {count}.

		Keybinding defined by `g:vindent_object_ii` is mapped to this
		text object, which consists of two |vindent_plug|s:
		    - `<PLug>(VindentObject_X_ii)`: for visual mode.
		    - `<PLug>(VindentObject_O_ii)`: for text object.

		Here are some quirks about objects in |vindent_Text_Objects|:
		    - The objects assume indentations are consistent, unless
		      |g:vindent_tabstop| is set.
		    - The objects ignore |empty| lines.
		    - The objects do not select |empty| lines at the
		      beginning or the end.
		    - The objects select nothing if the current line is
		      either "empty" or "not indented".

		For example, consider the following LaTeX code: >
			 1 \begin{enumerate}
			 2
			 3     \item
			 4
			 5         Some sentence that is
			 6         split into two lines.
			 7
			 8     \item
			 9         Another sentence here.
			10
			11 \end{enumerate}
<		If cursor is on line 5, |in_indent| selects lines 5 and 6.
		If cursor is on line 3, |in_indent| selects lines 3 to 9.
		If cursor is on line 3, |in_Indent| selects line  3.
		If cursor is on line 5, |an_indent| selects lines 3 to 6.
		If cursor is on line 3, |an_Indent| selects lines 1 to 11.
		If cursor is on line 1, |in_indent| and |an_indent| and
		|an_Indent| all select nothing since line 1 is not indented.

"in_Indent"					*in_Indent*
		Same as |in_indent|, but selects adjacent lines with the exact
		same indentations.

		Keybinding defined by `g:vindent_object_iI` is mapped to this
		text object, which consists of two |vindent_plug|s:
		    - `<PLug>(VindentObject_X_iI)`: for visual mode.
		    - `<PLug>(VindentObject_O_iI)`: for text object.

		See |in_indent| for details and example.

"an_indent"					*an_indent*
		Same as |in_indent|, but selects adjacent lines with the same
		or more indentations and one extra line at the beginning with
		less indentation.

		Keybinding defined by `g:vindent_object_ai` is mapped to this
		text object, which consists of two |vindent_plug|s:
		    - `<PLug>(VindentObject_X_ai)`: for visual mode.
		    - `<PLug>(VindentObject_O_ai)`: for text object.

		See |in_indent| for details and example.

"an_Indent"					*an_Indent*
		Same as |in_indent|, but selects adjacent lines with the same
		or more indentations and two extra lines with less
		indentation: one at the beginning and one at the end.

		Keybinding defined by `g:vindent_object_aI` is mapped to this
		text object, which consists of two |vindent_plug|s:
		    - `<PLug>(VindentObject_X_aI)`: for visual mode.
		    - `<PLug>(VindentObject_O_aI)`: for text object.

		See |in_indent| for details and example.

------------------------------------------------------------------------------
3.3 Miscellaneous                                      *vindent_Miscellaneous*

g:vindent_tabstop				*g:vindent_tabstop*
		Number of <Space>s assumed to be equivalent to 1 <Tab>.
		By default, |g:vindent_tabstop| is not defined and this plugin
		does not assume equivalence between <Tab> and <Space>s.

		In most cases, you should probably set this variable to
		|&tabstop| if you wish to ust it at all for the behaviour to
		match what you see visually.

==============================================================================
4. License                                                   *vindent_License*

Distributed under the same terms as Vim itself. See 
>
	:help license
<
for details.

==============================================================================
5. Bugs and Contributing                       *vindent_Bugs_and_Contributing*

No known bugs yet.  If you find one or would like to contribute to this
plugin, please create an issue or make a pull request at
https://github.com/jessekelighine/vindent.vim.

==============================================================================
6. Changelog                                               *vindent_Changelog*

v1.3.0                                                             2022-May-05
	- Add |g:vindent_tabstop|.
v1.2.0:                                                            2022-May-04
	- |vindent_Motions| now takes {count}.
v1.1.0:                                                            2022-May-03
	- Add |in_Indent| object.
v1.0.0:                                                            2022-May-03
	- Initial version.

==============================================================================
7. Credits                                                   *vindent_Credits*

This plugin is created by Jesse Chen. (email: jessekelighine@gmail.com)

==============================================================================
vim:tw=78:ts=8:noet:ft=help:norl:

