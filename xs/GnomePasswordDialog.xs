/*
 * Copyright (C) 2003 by the gtk2-perl team (see the file AUTHORS)
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * $Header$
 */

#include "gnome2perl.h"

MODULE = Gnome2::PasswordDialog		PACKAGE = Gnome2::PasswordDialog	PREFIX = gnome_password_dialog_

#ifdef GNOME_TYPE_PASSWORD_DIALOG

##  GtkWidget* gnome_password_dialog_new (const char *dialog_title, const char *message, const char *username, const char *password, gboolean readonly_username) 
GtkWidget*
gnome_password_dialog_new (class, dialog_title, message, username, password, readonly_username)
	const char *dialog_title
	const char *message
	const char *username
	const char *password
	gboolean readonly_username
    C_ARGS:
	dialog_title, message, username, password, readonly_username

##  gboolean gnome_password_dialog_run_and_block (GnomePasswordDialog *password_dialog) 
gboolean
gnome_password_dialog_run_and_block (password_dialog)
	GnomePasswordDialog *password_dialog

##  void gnome_password_dialog_set_username (GnomePasswordDialog *password_dialog, const char *username) 
void
gnome_password_dialog_set_username (password_dialog, username)
	GnomePasswordDialog *password_dialog
	const char *username

##  void gnome_password_dialog_set_password (GnomePasswordDialog *password_dialog, const char *password) 
void
gnome_password_dialog_set_password (password_dialog, password)
	GnomePasswordDialog *password_dialog
	const char *password

##  void gnome_password_dialog_set_readonly_username (GnomePasswordDialog *password_dialog, gboolean readonly) 
void
gnome_password_dialog_set_readonly_username (password_dialog, readonly)
	GnomePasswordDialog *password_dialog
	gboolean readonly

# FIXME: *_remember* present in the headers but not in the library?
###  void gnome_password_dialog_set_remember (GnomePasswordDialog *password_dialog, gboolean remember) 
#void
#gnome_password_dialog_set_remember (password_dialog, remember)
#	GnomePasswordDialog *password_dialog
#	gboolean remember

###  void gnome_password_dialog_set_remember_label_text (GnomePasswordDialog *password_dialog, const char *remember_label_text) 
#void
#gnome_password_dialog_set_remember_label_text (password_dialog, remember_label_text)
#	GnomePasswordDialog *password_dialog
#	const char *remember_label_text

##  char * gnome_password_dialog_get_username (GnomePasswordDialog *password_dialog) 
char *
gnome_password_dialog_get_username (password_dialog)
	GnomePasswordDialog *password_dialog
    CLEANUP:
	g_free (RETVAL);

##  char * gnome_password_dialog_get_password (GnomePasswordDialog *password_dialog) 
char *
gnome_password_dialog_get_password (password_dialog)
	GnomePasswordDialog *password_dialog
    CLEANUP:
	g_free (RETVAL);

###  gboolean gnome_password_dialog_get_remember (GnomePasswordDialog *password_dialog) 
#gboolean
#gnome_password_dialog_get_remember (password_dialog)
#	GnomePasswordDialog *password_dialog

#endif /* GNOME_TYPE_PASSWORD_DIALOG */
