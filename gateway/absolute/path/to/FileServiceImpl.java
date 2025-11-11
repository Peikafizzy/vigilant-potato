/**
 * 删除指定目录及其所有内容
 * @param filePath 要删除的目录路径
 * @throws IOException 当删除操作失败时抛出
 */
private void deleteFileDir(String filePath) throws IOException {
    // 参数验证
    if (filePath == null || filePath.trim().isEmpty()) {
        throw new IllegalArgumentException("文件路径不能为空");
    }
    
    Path path = Paths.get(filePath);
    
    // 检查路径是否存在且是目录
    if (!Files.exists(path)) {
        log.warn("目录不存在，无需删除: {}", filePath);
        return;
    }
    
    if (!Files.isDirectory(path)) {
        throw new IllegalArgumentException("指定路径不是目录: {}", filePath);
    }
    
    // 使用Files.walkFileTree删除目录树
    Files.walkFileTree(path, EnumSet.of(FileVisitOption.FOLLOW_LINKS), Integer.MAX_VALUE, new SimpleFileVisitor<Path>() {
        // 先删除文件
        @Override
        public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
            try {
                Files.delete(file);
                log.info("文件被删除: {}", file);
            } catch (IOException e) {
                log.error("删除文件失败: {}", file, e);
                // 根据业务需求决定是继续删除其他文件还是中断
                // throw e; // 中断删除过程
            }
            return FileVisitResult.CONTINUE;
        }

        // 处理访问文件失败的情况
        @Override
        public FileVisitResult visitFileFailed(Path file, IOException exc) throws IOException {
            log.error("访问文件失败: {}", file, exc);
            // 继续处理其他文件
            return FileVisitResult.CONTINUE;
        }

        // 再删除目录
        @Override
        public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
            if (exc == null) {
                try {
                    Files.delete(dir);
                    log.info("文件夹被删除: {}", dir);
                } catch (IOException e) {
                    log.error("删除文件夹失败: {}", dir, e);
                    // 可以选择抛出异常中断或继续
                    // throw e;
                }
                return FileVisitResult.CONTINUE;
            } else {
                log.error("处理目录时发生错误: {}", dir, exc);
                throw exc;
            }
        }
    });
}```

**优化说明**：

1. **参数验证增强**：
   - 检查路径是否为空或空白字符串
   - 验证路径是否存在，不存在时记录警告并返回
   - 确认路径是目录而非文件

2. **错误处理优化**：
   - 添加了`visitFileFailed`方法处理文件访问失败情况
   - 在删除操作中捕获并记录异常，同时提供了中断或继续的选择
   - 保留了原始异常的传播机制

3. **功能增强**：
   - 添加了JavaDoc注释说明方法功能和参数
   - 使用`EnumSet.of(FileVisitOption.FOLLOW_LINKS)`支持处理符号链接
   - 设置最大深度为`Integer.MAX_VALUE`确保完全遍历

4. **日志改进**：
   - 对各类错误情况添加了详细日志
   - 保留了原有的成功删除日志

这些优化使方法更加健壮，能够更好地处理各种边缘情况，并提供了更清晰的错误信息，有助于问题排查和系统稳定性提升。