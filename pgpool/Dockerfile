# custom built image, with pgpool 4.4.4 source
FROM pgpool-custom:4.4.4
COPY . .
RUN chmod +x /wait-for-db.sh
ENTRYPOINT ["/wait-for-db.sh"]
CMD ["pgpool", "-n"]