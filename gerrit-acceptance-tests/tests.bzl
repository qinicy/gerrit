load('//tools/bzl:junit.bzl', 'junit_tests')

BOUNCYCASTLE = [
  '//lib/bouncycastle:bcpkix-without-neverlink',
  '//lib/bouncycastle:bcpg-without-neverlink',
]

def acceptance_tests(
    group,
    srcs,
    flaky = 0,
    deps = [],
    labels = [],
    vm_args = ['-Xmx256m'],
    **kwargs):
  junit_tests(
    name = group,
    srcs = srcs,
    flaky = flaky,
    deps = deps + BOUNCYCASTLE + [
      '//gerrit-acceptance-tests:lib',
    ],
    tags = labels + [
      'acceptance',
      'slow',
    ],
    jvm_flags = vm_args,
    **kwargs
  )
