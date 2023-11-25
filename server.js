const { exec } = require('child_process');

// 假设 entrypoint.sh 位于当前工作目录
const entrypointScript = './entrypoint.sh';

// 执行 entrypoint.sh 脚本
const child = exec(`sh ${entrypointScript}`, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing entrypoint.sh: ${error}`);
    return;
  }
  console.log(`entrypoint.sh output:\n${stdout}`);
});

// 捕获子进程的输出
child.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

// 捕获子进程的错误输出
child.stderr.on('data', (data) => {
  console.error(`stderr: ${data}`);
});

// 子进程关闭事件
child.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});
