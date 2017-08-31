# FFmpeg Puppet Module

#### Table of Contents

1. [Module Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ffmpeg](#beginning-with-ffmpeg)
3. [Usage](#usage)
4. [Reference](#reference)
4. [Limitations](#limitations)
5. [Development](#development)

## Description

FFmpeg is a free software project that produces libraries and programs for handling multimedia data.
This module provides the ability to manage the installation of FFmpeg using puppet.

Currently only supports RetHat, CentOS and Amazon Linux.

## Setup

### Setup Requirements

**WARNING:** For RedHat systems, you may need to add an additional repository like the [EPEL repository](http://fedoraproject.org/wiki/EPEL).
You can use the module [stahnma-epel](https://forge.puppetlabs.com/stahnma/epel) to do this.

* The [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) Puppet library.

### Beginning with ffmpeg

#### librarian-puppet

Add the following snippet to your `Puppetfile`.
```
mod 'jarodiv-ffmpeg’
  :git => https://github.com/jarodiv/puppet-ffmpeg.git
```

## Usage

Simply include the main class to get started with the default options:

```puppet
include '::ffmpeg'
```

If you want to additionally install the development libraries:

```puppet
class { 'ffmpeg':
  include_devel  => true,
}
```

This module also supports Hiera. Just include the ffmpeg class and configure it like this;

```yaml
ffmpeg::include_devel: true
```

## Reference

### Classes

#### Public Classes

* `ffmpeg`: Manages the installation of FFmpeg

#### Class: `ffmpeg`

#### `package_ensure`

Passed directly on to Puppet's `package` type `ensure` parameter.

Default: `present`.

#### `include_devel`

Whether to include development libraries.

Default: `false`

## Limitations

This module currently only supports RetHat, CentOS and Amazon Linux.

## Development

Pull requests are always welcome.
