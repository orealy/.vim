# vim:fileencoding=utf-8:noet

from __future__ import absolute_import

import os
from powerline.bindings.vim import vim_getbufoption, getbufvar


def test_help(matcher_info):
	return str(vim_getbufoption(matcher_info, 'buftype')) == 'help'

def unite(matcher_info):
	return(str(getbufvar(matcher_info['bufnr'], '&filetype')) == 'unite')
