# AuthMvpi

[![Build Status](https://img.shields.io/travis/dwyl/auth-mvp/master.svg?style=flat-square)](https://travis-ci.org/dwyl/auth-mvp)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/auth-mvp/master.svg?style=flat-square)](http://codecov.io/github/dwyl/auth-mvp?branch=master)

DWYL Authentication service

## API

- `/auth/urls`: returns list of oauth applications' url.

## Sending Emails From Auth App Requires

The only requirement that you need to fulfil
in order to enable sending emails
is having the `EMAIL_APP_URL` set in your `.env`
and the `SECRET_KEY_BASE` environment variable needs to be the _same_
as the `dwylmail` Heroku app.

Visit: https://dashboard.heroku.com/apps/dwylmail/settings
and copy the `SECRET_KEY_BASE` from Config Vars.
