Name:           template-c-utility
Version:        %{version}
Release:        1%{?dist}
Summary:        Compiled C utility template
License:        MIT

%description
A high-performance compiled C utility packaged for sstix-tools.

%install
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_datadir}/zsh/site-functions
install -m 0755 %{_sourcedir}/template-c-utility %{buildroot}%{_bindir}/template-c-utility
install -m 0644 %{_sourcedir}/_template-c-utility %{buildroot}%{_datadir}/zsh/site-functions/_template-c-utility

%files
%{_bindir}/template-c-utility
%{_datadir}/zsh/site-functions/_template-c-utility
