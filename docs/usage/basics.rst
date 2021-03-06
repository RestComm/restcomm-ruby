.. module:: restcomm.rest

=========================
Accessing REST Resources
=========================

To access Restcomm REST resources, you'll first need to instantiate a
:class:`Restcomm::REST::Client`.

Authentication
--------------------------

The :class:`Restcomm::REST::Client` needs your Restcomm credentials. To get
your credentials, visit `your Restcomm account portal
<http://docs.telestax.com/restcomm-pages/>`_. If you don't have a Restcomm account
yet, go `here <http://docs.telestax.com/restcomm-pages/>`_ to get started.

Once you have your credentials, you can create create a new :class:`Client` and get started.

.. code-block:: ruby

    require 'restcomm-ruby'

    # To find these visit https://www.restcomm.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"
    host = "XXX.XXX.XXX.XXX"

    @client = Restcomm::REST::Client.new account_sid, auth_token, host

You can also configure the client using the top level configure method, like so:

.. code-block:: ruby

    require 'restcomm-ruby'

    Restcomm.configure do |config|
      config.account_sid = "ACXXXXXXXXXXXXXXXXX"
      config.auth_token = "YYYYYYYYYYYYYYYYYY"
    host = "XXX.XXX.XXX.XXX"
    end

    @client = Restcomm::REST::Client.new


Listing Resources
-------------------

The :class:`Client` gives you access to various list resources.
:meth:`ListResource.list`, by default, returns the most recent 50 instance resources.

.. code-block:: ruby

    require 'restcomm-ruby'

    # To find these visit https://www.restcomm.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"
    host = "XXX.XXX.XXX.XXX"

    @client = Restcomm::REST::Client.new account_sid, auth_token, host
	@calls = @client.calls.list()

:meth:`ListResource.list` accepts paging arguments.
The following will return page 3 with page size of 25.

.. code-block:: ruby

    require 'restcomm-ruby'

    # To find these visit https://www.restcomm.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"

    @client = Restcomm::REST::Client.new account_sid, auth_token, host
	@calls = @client.calls.list(page: 3, page_size: 25)


Get an Individual Resource
-----------------------------

To get an individual instance resource, use :meth:`ListResource.get`.
Provide the :attr:`sid` of the resource you'd like to get.

.. code-block:: ruby

    require 'restcomm-ruby'

    # To find these visit https://www.restcomm.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"
    host = "XXX.XXX.XXX.XXX"

    @client = Restcomm::REST::Client.new account_sid, auth_token, host

    @call = @client.calls.get("CA123")
    puts @call.to


Deleting a Resource
-------------------------------

Resources can only be deleted via their instance object. This means
you must instantiate an instance object using :meth:`ListResource.get`
and then call :meth:`delete` on it.

.. code-block:: ruby

    require 'restcomm-ruby'

    # To find these visit https://www.restcomm.com/user/account
    account_sid = "ACXXXXXXXXXXXXXXXXX"
    auth_token = "YYYYYYYYYYYYYYYYYY"
    host = "XXX.XXX.XXX.XXX"

    @client = Restcomm::REST::Client.new account_sid, auth_token, host

    @recording = @client.recordings.get("RC123")
    @recording.delete()

